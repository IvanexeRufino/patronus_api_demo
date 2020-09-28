package patronus_api_2

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }
        "/"(controller: "liveAlerts")
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
