$(document).on('turbolinks:load', function() {
  const form = $("#charge-form");
  Payjp.setPublicKey("pk_test_115115a6e1739479fe4d883f");

  $("#charge-form").on("click", "#submit-button", function(e) {
    e.preventDefault();
    form.find("input[type = submit]").prop("disabled", true);

    const card = {
          number: $("#card_number").val(),
          cvc: $("#cvc").val(),
          exp_month: $("#exp_month").val(),
          exp_year: $("#exp_year").val(),
    };

    Payjp.createToken(card, function(s, response) {
      if (response.error) {
        alert("error");
      }
      else {
        $(".number").removeAttr("name");
        $(".cvc").removeAttr("name");
        $(".exp_month").removeAttr("name");
        $(".exp_year").removeAttr("name");
        const token = response.id;

        form.append($('<input type = "hidden" name = "payjp_token" />').val(token));
        form.get(0).submit();
      }
    });
  });
});