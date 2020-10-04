package patronus_api_2

import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_EMPLOYEE', 'ROLE_ADMIN'])
class LiveAlertsController {

    def index() {

    }

}
