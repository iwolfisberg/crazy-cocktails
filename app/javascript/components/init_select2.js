import 'select2';

const initSelect2 = () => {
  $('.cocktail_doses_ingredient > .form-control').select2({
    placeholder: 'Select an ingredient',
    allowClear: true
  });
};

const initSelect2Callback = () => {
  const doses = document.getElementById("doses");
  console.log(doses);
  $(doses)
  .on('cocoon:after-insert', function(e, insertedItem) {
    console.log("Hello");
  });
  $(doses).on('click', function(){
     console.log('looks like clicking works...'); //this works fine
   });
}

export { initSelect2, initSelect2Callback };
