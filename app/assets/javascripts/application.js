//= require rails-ujs
//= require turbolinks
//= require_tree .
//= require jquery3
//= require popper
//= require bootstrap
//= require select2-full
//= require select2_locale_fr
//= require flatpickr
//= require flatpickr/l10n/fr
//= require socket.io
//= require tinymce-jquery

document.addEventListener('turbolinks:load', function () {
    flatpickr('.form-datepickr', {
        altInput: true,
        altFormat: 'j F Y',
        maxDate: new Date(),
        locale: 'fr'
    })

    $('select[multiple]').select2({
        theme: "bootstrap"
    })

    // Online users - Socket.Io
    let presence = document.querySelector('#presence')
    let addUser = (user) => {
        let li = document.createElement('li')
        li.innerText = user.name
        li.id = 'user' + user.id
        presence.appendChild(li)
    }

    if (presence) {
        let socket = io('http://192.168.0.220:3001')
        socket.on('connect', () => {
            socket.emit('identify', {
                token: presence.dataset.token
            })
        })

        socket.on('user.new', ({user}) => addUser(user))

        socket.on('user.leave', ({user}) => {
            presence.removeChild(document.querySelector('#user' + user.id))
        })

        socket.on('users', ({users}) => {
            for (let k in users) {
                addUser(users[k])
            }
        })
    }
    // END

})