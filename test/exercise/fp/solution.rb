module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        target_films = array
                       .select { |film| (film['country'] || '').split(',').size > 1 }
                       .map { |film| film['rating_kinopoisk'].to_f }
                       .select(&:positive?)

        target_films.inject(:+) / target_films.size
      end

      def chars_count(films, threshold)
        films
          .select { |film| film['rating_kinopoisk'].to_f >= threshold }
          .map { |film| film['name'].count 'и' }
          .inject(:+)
      end
    end
  end
end
