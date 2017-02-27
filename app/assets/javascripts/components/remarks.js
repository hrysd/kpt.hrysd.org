Vue.component('remarks', {
  template: `
    <section :class='kind'>
      <header>
        <h2>{{kind}} TODO: Capitalize</h2>
      </header>

      <ul>
        <remark
          v-for='(remark, index) in remarks'
          :remark='remark'
        >
        </remark>
      </ul>

      <remark-form />
    </section>
  `,
  props: ['kind', 'remarks']
});
