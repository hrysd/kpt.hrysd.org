class Client {
  constructor(permalink) {
    this.permalink = permalink;
  }

  createRemark(resource, content) {
    const endpoint = `/api/${permalink}/${resource}`;

    return axios.post(endpoint, {content});
  }
}
