$(document).on('turbolinks:load', function() {
  const form = $("#charge-form");
  Payjp.setPublicKey(ENV["PAYJP_KEY"]);

  $("#charge-form").on("click", "#submit-button", function(e) {
    e.preventDefault();
    form.find("input[type=submit]").prop("disabled", true);
    const card = {
        number: parseInt($("#card_number").val()),
        cvc: parseInt($("#cvc").val()),
        exp_month: parseInt($("#exp_month").val()),
        exp_year: parseInt($("#exp_year").val())
    };
    Payjp.createToken(card, function(s, response) {
      if (response.error) {
        alert("error")
        form.find('button').prop('disabled', false);
      }
      else {
        $(".number").removeAttr("name");
        $(".cvc").removeAttr("name");
        $(".exp_month").removeAttr("name");
        $(".exp_year").removeAttr("name");

        const token = response.id;
        $("#charge-form").append($('<input type="hidden" name="payjp_token" class = "payjp-token" />').val(token));
        $("#charge-form").get(0).submit();
      }
    });
  });
});