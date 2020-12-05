class Character
    attr_accessor :name, :birth_year, :hair_color, :homeworld_url, :homeworld

    @@all = []

    def initialize(data)
        # data.each do |key, value|
        #     if self.methods.include?("#{key}=".to_sym)
        #         self.send("#{key}=", value)
        #     end
        # end

        self.name = data["name"]
        self.birth_year = data["birth_year"]
        self.hair_color = data["hair_color"]
        self.homeworld_url = data["homeworld"]
        # binding.pry
        @@all << self

    end

    def self.all
        @@all
    end
end