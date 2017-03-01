const pluralize   = require('pluralize');
const ActionCable = require('actioncable');

function createCable(url) {
  return ActionCable.createConsumer(url);
}

function createWebsocketPlugin(url, permalink) {
  const cable = createCable(url)

  return (store) => {
    cable.subscriptions.create({channel: 'RemarksChannel', permalink: permalink},
      {
        connected()    { console.log('connected'); },
        disconnected() { console.log('disconnected'); },
        received({event_name, data}) {
          switch(event_name) {
            case 'keep:created':
            case 'problem:created':
            case 'tri:created':
              store.commit('ADD_REMARK', {resource: pluralize(data.kind), remark: data});
              break;
            case 'keep:deleted':
            case 'problem:deleted':
            case 'tri:deleted':
              store.commit('REMOVE_REMARK', {resource: pluralize(data.kind), remarkId: data.id});
              break;
            case 'keep:reacted':
            case 'problem:reacted':
            case 'tri:reacted':
              store.commit('THUMBS_UP', {resource: pluralize(data.kind), remark: data});
              break;
            case 'board:closed':
              store.commit('CLOSE_BOARD');
          }
        }
      }
    );
  }
}

module.exports = createWebsocketPlugin;
