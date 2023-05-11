var login = (function () {
    var configs = {
        urls: {
            trocarsenha: ''
        }
    };

    var init = function ($configs) {
        configs = $configs
    };


    function verificacaoSenha() {
        model = $('#form-trocarSenha').serializeObject();

        if(model.novaSenha != model.repitaSenhaNova){
            site.toast.error("Senhas diferentes.");
            return;
        } else if(model.novaSenha.length < 6){
            site.toast.error("Sua senha deve possuir no mínimo 6 dígitos.");
            return;
        }
        
        $.post(configs.urls.trocarsenha, model).done(function () {
            site.toast.success("Senha trocada com sucesso!");
            $('#modal-trocar-senha').hide();
            $('#form-trocarSenha').find('[name="email"], [name="senhaAtual"], [name="novaSenha"], [name="repitaSenhaNova"]').val('');
        }).fail(function () {
            site.toast.error("Falha ao trocar senha");
        });
    };

    return {
        init: init,
        verificacaoSenha: verificacaoSenha
    };

})();
