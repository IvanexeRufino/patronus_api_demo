package patronus_api_2

import grails.plugin.springsecurity.userdetails.GrailsUser
import grails.plugins.rest.client.RestBuilder
import groovy.transform.CompileStatic
import org.grails.web.json.JSONElement
import org.springframework.security.authentication.AuthenticationProvider
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken
import org.springframework.security.core.Authentication
import org.springframework.security.core.AuthenticationException
import org.springframework.security.core.GrantedAuthority
import org.springframework.util.LinkedMultiValueMap
import org.springframework.util.MultiValueMap

@CompileStatic
class BackendAuthenticationProvider implements AuthenticationProvider{

    static RestBuilder rest = new RestBuilder()

    @Override
    Authentication authenticate(Authentication authentication) throws AuthenticationException {
        Authentication token = null

        String user = authentication.principal
        String pass = authentication.credentials

        MultiValueMap<String, String> form = new LinkedMultiValueMap<String, String>()
        form.add("mail", (String) user)
        form.add("password", (String) pass)
        def resp = rest.post("https://fierce-caverns-84695.herokuapp.com/companies/sign_in") {
            contentType("application/json")
            body('{"mail": "' + user + '", "password": "' + pass + '"}')
        }

        def json = resp.json

        if(!json["statusCode"]) {
            def authority = new GrantedAuthoritiesImpl(getAuthority(json))

            List<GrantedAuthority> authorities = []
            authorities.add(authority)

            def userDetails = new GrailsUser((String) user, (String) pass, true, true, true, true, authorities, json['legajo'])
            token = new UsernamePasswordAuthenticationToken(userDetails, pass, userDetails.authorities)
            token.details = authentication.details
        }

        return token
    }

    @Override
    boolean supports(Class<?> authentication) {
        return true
    }

    static String getAuthority(json) {
        if(json['type'] == "employee") {
            return "ROLE_EMPLOYEE"
        } else if (json['type'] == "admin") {
            return "ROLE_ADMIN"
        } else {
            return "ROLE_ADMIN_PATRONUS"
        }

    }
}

class GrantedAuthoritiesImpl implements GrantedAuthority {

    private String authority

    GrantedAuthoritiesImpl(String authority) {
        this.authority = authority
    }

    @Override
    String getAuthority() {
        return authority
    }
}


