module.exports = {
  markdownedContent(state) {
    const kinds = ['keeps', 'problems', 'tris'];

    let text = '';

    kinds.forEach((kind) => {
      if (state[kind].length === 0) { return; }

      const body = state[kind].map(({content}) => {
        return `- ${content}`;
      }).join('\n')

      return text += `## ${kind}\n\n${body}\n\n`;
    })

    return text;
  }
}
