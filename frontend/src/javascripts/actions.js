const Client = require('./client');

module.exports = {
  addRemark({commit, state}, {resource, content}) {
    Client.createRemark(state.permalink, resource, content);
  },
  thumbsUp({state}, remarkId) {
    Client.createReaction(state.permalink, remarkId);
  },
  removeRemark({state}, {resource, remarkId}) {
    Client.removeRemark(state.permalink, resource, remarkId);
  },
  closeBoard({state}) {
    Client.closeBoard(state.permalink);
  }
};
