// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//

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

Vue.component('remark-form', {
  template: `
    <form class='inline-form'>
      <div class='form-item'>
        <input type='text'>
      </div>

      <div class='form-button'>
        <button>Add</button>
      </div>
    </form>
  `,
});
