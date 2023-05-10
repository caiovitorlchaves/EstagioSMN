var login = (function () {
    var configs = {
        urls: {
            login: '',
            trocarSenha: '',
            enviar: '',
            esqueciSenha: '',
            home: ''
        }
    };

    var init = function ($configs) {
        configs = $configs
    };


    function verificacaoSenha() {
        model = $('#form-trocarSenha').serializeObject();

        if (model.novaSenha != model.senhaNovaRepetida) {
            site.toast.error("Senhas precisam ser iguais. ");
            return;
        } else if (model.novaSenha.length < 6) {
            site.toast.error("Sua senha deve possuir no mínimo 6 dígitos.");
            return;
        }
        
        $.post(configs.urls.trocarSenha, model).done(function () {
            site.toast.success("Senha alterada com sucesso");
            $('#modal-trocar-senha').hide();
            $('#form-trocarSenha')
            .find('[name="email"], [name="senhaAtual"], [name="novaSenha"], [name="repitaSenhaNova"]')
            .val('');
        }).fail(function (msg) {
            site.toast.error(msg);
        });
    };

    function verificarEmail() {
        model = $('#form-receberEmail').serializeObject();

        if (model.email != '') {
            $.get(configs.urls.enviar, model).done(function () {
                site.toast.success("Email enviado com sucesso!");
                $('#modal-enviar-email').hide();
                $('#form-receberEmail').find('[name="email"]').val('');
            }).fail(function (msg) {
                site.toast.error(msg);
            });
    };
   };

    function esqueciSenha() {
        model = $('#form-esqueci-senha').serializeObject();
        if (model.senhaNova.length < 6) {
            site.toast.error("Sua senha deve possuir no mínimo 6 dígitos.");
            $('#form-esqueci-senha').find('[name="senhaNova"], [name="senhaNovaRepetida"]').val('');
        }
        else if (model.senhaNova != model.senhaNovaRepetida) {
            site.toast.error("Senhas precisam ser iguais.");
            $('#form-esqueci-senha').find('[name="senhaNova"], [name="senhaNovaRepetida"]').val('');
        } else {
            $.post(configs.urls.esqueciSenha, model).done(function () {
                site.toast.success("Senha alterada com sucesso!");
                location.href = configs.urls.login;
            }).fail(function () {
                site.toast.error("Falha ao alterar senha");
            });
        }
    };

    function login() {
        model = $('#form-busca').serializeObject();
        if (model['Senha'].length < 6) {
            site.toast.error("Sua senha deve pussuir no mínimo 6 dígitos.");
            return;
        }

        $.post(configs.urls.login, model).done(function () {
            site.toast.success("Login realizado com sucesso");
            location.href = (configs.urls.home)
        }).fail(function (msg) {
            
            $('#form-trocarSenha').find('#trocar-senha-email').val(model['Email']);
            if (msg.responseText === "Senha Expirada!")
                site.toast.info(msg)
            else
                site.toast.error(msg);
        });
    }

    return {
        init: init,
        verificacaoSenha: verificacaoSenha,
        verificarEmail: verificarEmail,
        esqueciSenha: esqueciSenha,
        login: login
    };

})();
