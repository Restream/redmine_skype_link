module RedmineSkypeLink
  class Patcher

    def self.apply(patch, *targets)
      targets = Array(targets).flatten
      targets.each do |target|
        unless target.included_modules.include? patch
          target.prepend patch
        end
      end
    end

  end
end
