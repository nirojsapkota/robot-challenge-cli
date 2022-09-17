module Commands
    class Report < Command
    def run
      super
      puts @robot.report
    end
  end
end
