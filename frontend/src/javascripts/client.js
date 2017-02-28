const axios = require('axios');

const Client = {
  createRemark(permalink, resource, content) {
    const endpoint = `/api/${permalink}/${resource}`;

    return axios.post(endpoint, {content});
  }
}

module.exports = Client;
