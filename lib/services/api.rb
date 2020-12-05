class Api

    def self.base_url
        "https://swapi.dev/api"
    end

    def self.load_data
        load_characters
        load_planets
    end

    # def self.load_planets
    #     Character.all.each do |character|
    #         response = RestClient.get(character.homeworld_url)
    #         data = JSON.parse(response.body)

    #         character.homeworld = Planet.new(data)
    #     end
    # end
    
    def self.load_characters
        page_number = 1

        # response = RestClient.get(base_url + "/people/?page=#{page_number}")
        # data = JSON.parse(response.body)
        
        while true
            response = RestClient.get(base_url + "/people/?page=#{page_number}")
            data = JSON.parse(response.body)
            # binding.pry
            data["results"].each do |character_data|
                Character.new(character_data)
            end

            if data["next"].nil?
                break
            end

            page_number += 1
        end
        # binding.pry

    end
end