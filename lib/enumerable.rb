module Enumerable
  def cluster
    cluster = []
    each do |element|
      if cluster.last && yield(cluster.last.last) == yield(element)
        cluster.last << element
      else
        cluster << [element]
      end
    end
    cluster
  end
end
