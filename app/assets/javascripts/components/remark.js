Vue.component('remark', {
  template: `
    <li>
      <p>{{remark.content}}</p>

      <span class='thumbs-up'>
        <i class='fa fa-thumbs-o-up'></i>
        {{remark.reactions_count}}
      </span>

      <span class='remove-button'>
        <i class='fa fa-times'></i>
      </span>
    </li>
  `,
  props: ['remark']
});
