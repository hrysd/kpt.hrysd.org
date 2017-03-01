const axios = require('axios');

const Client = {
  createRemark(permalink, resource, content) {
    const endpoint = `/api/${permalink}/${resource}`;

    return axios.post(endpoint, {content});
  },
  createReaction(permalink, remarkId) {
    const endpoint = `/api/${permalink}/remarks/${remarkId}/reactions`;

    return axios.post(endpoint);
  },
  removeRemark(permalink, resource, remarkId) {
    const endpoint = `/api/${permalink}/${resource}/${remarkId}`;

    return axios.delete(endpoint);
  }
}

module.exports = Client;
