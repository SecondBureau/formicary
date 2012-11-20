module Formicary
  module ChartsHelper
    private

    def chartNodes(chartId)
      #TODO : return if chartID doesn't exist.
      #TODO : performances issue. Cache needed (either in database chart model, or rails cache)
      origin = Chart.find(chartId).nodes.select{|n| n.parents.count.eql?(0)}.first
      buildOrg(origin).to_json if origin
    end

    #TODO : rewrite with inject?
    def buildOrg(node)
      children = []
      if node.children
        node.children.each do |child|
          children << buildOrg(child)
        end
      end
      parents = []
      if node.parents
        node.parents.each do |parent|
          parents << parent.id
        end
      end

      {
        :id => node.id,
        :title => node.title,
        :english => node.english,
        :chinese => node.chinese,
        :to_url => node.to_url,
        :comment => node.comment,
        :position => node.position,
        :decoration => node.decoration,
        :node_type => node.node_type,
        :children => children,
        :parents => parents
      }
    end
  end
end
