var usuario = (function () {
    var configs = {
        urls: {
            cadastro: '',
            bloquear: '',
            buscar: '',
            editar: '',
            bloquearUsuarioUltimoAcesso: '',
            editarUsuarioultimoAcesso: '',
            ultimoAcesso: ''
        }
    };

    var init = function ($configs) {
        configs = $configs
    };

    function cadastro() {
        model = $('#form-cadastro').serializeObject();

        $.post(configs.urls.cadastro, model).done(function () {
            site.toast.success("Usuário cadastrado com sucesso!");
            $('#form-cadastro').find('[name="Apelido"], [name="Email"]').val('');
            $('#modal-cadastrar').hide();
            $('#form-busca').submit();
        }).fail(function (msg) {
            site.toast.error(msg);
        });
    };

    var bloquearUsuario = function (model) {
        model = $('#form-bloquear').serializeObject();
        if (model.Bloqueado == 0) {
            $.post(configs.urls.bloquear, model).done(function () {
                site.toast.success("Usuário desbloqueado com sucesso!");
                $('#modal-bloquear').remove();
                $('#form-busca').submit();
            }).fail(function (msg) {
                site.toast.error(msg);
            });
        } else {
            $.post(configs.urls.bloquear, model).done(function () {
            site.toast.success("Usuário bloqueado com sucesso!");
            $('#modal-bloquear').remove();
            $('#form-busca').submit();
        }).fail(function (msg) {
            site.toast.error(msg);
        });
        }
    };
    var bloquearUsuarioUltimoAcesso = function (model) {
        model = $('#form-bloquear-ultimoAcesso').serializeObject();

        if (model.Bloqueado == 0) {
            $.post(configs.urls.bloquearUsuarioUltimoAcesso, model).done(function () {
                site.toast.success("Usuário desbloqueado com sucesso!");
                $('#modal-bloquear-ultimoAcesso').remove();
                $('#form-busca').submit();
            }).fail(function (msg) {
                site.toast.error(msg);
            });
        } else {
            $.post(configs.urls.bloquearUsuarioUltimoAcesso, model).done(function () {
            site.toast.success("Usuário bloqueado com sucesso!");
            $('#modal-bloquear-ultimoAcesso').remove();
            $('#form-busca').submit();
        }).fail(function (msg) {
            site.toast.error(msg);
        });
        }
    };

    var editarUsuario = function (model) {
        model = $('#form-editar').serializeObject();

        $.post(configs.urls.editar, model).done(function () {
            site.toast.success("Usuário editado com sucesso!");
            $('#modal-editar').remove();
            $('#form-busca').submit();
        }).fail(function (msg) {
            site.toast.error(msg);
        });
    };

    var editarUsuarioultimoAcesso = function (model) {
        model = $('#form-editar-ultimoAcesso').serializeObject();

        $.post(configs.urls.editarUsuarioultimoAcesso, model).done(function () {
            site.toast.success("Usuário editado com sucesso!");
            $('#modal-editar-ultimoAcesso').remove();
            $('#form-busca').submit();
        }).fail(function (msg) {
            site.toast.error(msg);
        });
    };
    var preencheModalBloquear = function(id, dataBloqueio) {
        $('#form-bloquear').find('#idBloquearUsuario').val(id);
        $('#form-bloquear-ultimoAcesso').find('#idBloquearUsuario-ultimoAcesso').val(id);
        var bloqueado;
        var titulo;
        var texto;
        if(dataBloqueio.length) {
            bloqueado = 0;
            titulo = "DESBLOQUEAR";
            texto = "Deseja desbloquear o usuário selecionado?";
        } else {
            bloqueado = 1;
            titulo = "BLOQUEAR";
            texto = "Deseja bloquear o usuário selecionado?";
        }
        $('#form-bloquear').find('[name="Bloqueado"]').val(bloqueado);
        $('.modal-bloquear').find('#titulo-bloquear').html(titulo);
        $('#form-bloquear').find('p').html(texto);
    }

    var preencheModalEditar = function (id, apelido, email, dataBloqueaio) {
        $('#form-editar').find('#idEditarUsuario').val(id);
        $('#form-editar').find('#inputApelido').val(apelido);
        $('#form-editar').find('#inputEmail').val(email)
        $('#form-editar').find('#inputDataBloqueio').val(dataBloqueaio);
        $('#form-editar-ultimoAcesso').find('#idEditarUsuario-ultimoAcesso').val(id);
        $('#form-editar-ultimoAcesso').find('#inputApelido-ultimoAcesso').val(apelido);
        $('#form-editar-ultimoAcesso').find('#inputEmail-ultimoAcesso').val(email)
        $('#form-editar-ultimoAcesso').find('#inputDataBloqueio-ultimoAcesso').val(dataBloqueaio);
    };

    var buscar = function () {
        model = $('#form-busca').serializeArray();
        
        $.post(configs.urls.buscar, model).done(function (html) {
            $('#clicarResultado').click();
            $('#ResultadoPesquisa').html(html);
            $('.consulta').addClass('consultaOver');
        }).fail(function (msg) {
            site.toast.error(msg);
        });
    };

    var ultimoAcesso = function () {
        $.get(configs.urls.ultimoAcesso).done(function (html) {
            $('#UltimoAcesso').html(html);
        });
    };

    var consultaFicaClaro = function () {
        $('.consulta').removeClass('consultaOver');
    }

    var toggleResultadoDiv = function () {
        if ($("input[name='Resultado']:checked").val() === "ResultadoPesquisa") {
            $('#ResultadoPesquisa').show();
            $('#UltimoAcesso').hide();
        }

        if ($("input[name='Resultado']:checked").val() === "UltimoAcesso") {
            $('#UltimoAcesso').show();
            $('#ResultadoPesquisa').hide();
            ultimoAcesso();
        }
    };

    $("input[name='Resultado']").on('change', function () {
        toggleResultadoDiv();
    });

    $('.input-busca').on('focus', function () {
        $('.consulta').css({ 'z-index': 99 });
        $(this).css({ 'z-index': 99 });
        $('.overlay').fadeIn(100);
        $('.consulta').removeClass('consultaOver');
    });

    $('.input-busca').on('blur', function () {
        $('.overlay').fadeOut(100);
        $(this).css({ 'z-index': 1 });
        $('.consulta').css({ 'z-index': 1 });
    });

    return {
        init: init,
        cadastro: cadastro,
        bloquearUsuario: bloquearUsuario,
        preencheModalBloquear: preencheModalBloquear,
        preencheModalEditar: preencheModalEditar,
        buscar: buscar,
        editarUsuario: editarUsuario,
        consultaFicaClaro: consultaFicaClaro,
        bloquearUsuarioUltimoAcesso: bloquearUsuarioUltimoAcesso,
        editarUsuarioultimoAcesso: editarUsuarioultimoAcesso
    };

})();
