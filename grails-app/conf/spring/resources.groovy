import patronus_api_2.BackendAuthenticationProvider
import patronus_api_2.UserPasswordEncoderListener
// Place your Spring DSL code here
beans = {
    userPasswordEncoderListener(UserPasswordEncoderListener)
    backendAuthenticationProvider(BackendAuthenticationProvider)

}
