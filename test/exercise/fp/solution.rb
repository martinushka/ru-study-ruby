module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        filtered_films = array.filter { |film| film['rating_kinopoisk'].to_f.positive? && film['country'] && film['country'].split(',').length >= 2 }
        total_rating = filtered_films.reduce(0) { |sum, film| sum + film['rating_kinopoisk'].to_f }
        total_rating / filtered_films.length
      end

      def chars_count(films, threshold)
        films_with_high_rating = films.select { |film| film['rating_kinopoisk'].to_f >= threshold.to_f if film['rating_kinopoisk'] }
        films_with_high_rating.map { |film| film['name'] }.reduce(0) { |count, name| count + name.count('и') }
      end
    end
  end
end
