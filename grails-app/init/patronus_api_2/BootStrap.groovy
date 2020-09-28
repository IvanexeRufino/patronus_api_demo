package patronus_api_2

class BootStrap {

    def init = { servletContext ->
        def admin = Role.findOrSaveWhere(authority: 'ROLE_ADMIN')
        def employee = Role.findOrSaveWhere(authority: 'ROLE_EMPLOYEE')
        def hola = User.findOrSaveWhere(username: 'hola', password: 'hola')
        def chau = User.findOrSaveWhere(username: 'chau', password: 'chau')

        if(!hola.authorities.contains(admin)) {
            UserRole.create(hola, admin, true)
        }

        if(!chau.authorities.contains(employee)) {
            UserRole.create(chau, employee, true)
        }
    }
    def destroy = {
    }
}
