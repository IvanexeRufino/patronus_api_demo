package patronus_api_2

import grails.plugins.rest.client.RestBuilder
import org.springframework.util.LinkedMultiValueMap
import org.springframework.util.MultiValueMap

class LoginController {

    def rest = new RestBuilder()
    
    def index() {}

    def auth() {

        def user = params.user
        def pass = params.pass

        def resp = rest.post("https://fierce-caverns-84695.herokuapp.com/users/sign_in") {
            contentType("application/json")
            json {
                mail = user
                password = pass
            }
        }
        Map json = resp.json

        if(json.statusCode == 400) {
            println("TA INVALIDO")
            render(view:"index.gsp", model: [userInvalid: true])
        } else {
            println("TA VALIDO")
            redirect(controller: "liveAlerts")
        }
        print(json)
    }
}
