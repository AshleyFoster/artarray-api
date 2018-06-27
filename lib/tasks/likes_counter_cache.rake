desc 'Counter cache for Posts has manly likes'

task likes_counter: :environment do
  Post.reset_column_information
  Post.pluck(:id).each do |p|
    Post.reset_counters p, :likes
  end
end
