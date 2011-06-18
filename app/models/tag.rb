class Tag < ActsAsTaggableOn::Tag
  
  def self.tags(options = {})
    query = "select tags.id, tags.name, count(*) as count"
    query << " from taggings, tags"
    query << " where tags.id = tag_id"
    query << " group by tags.id,tags.name"
    query << " order by #{options[:order]}" if options[:order] != nil
    query << " limit #{options[:limit]}" if options[:limit] != nil
    tags = Tag.find_by_sql(query)
  end
  
end
