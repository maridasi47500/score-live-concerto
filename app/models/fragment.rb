require "nokogiri"
class Fragment < ApplicationRecord
belongs_to :composer
has_many :clips

after_create :hey
after_update :hey
def hey
@fragment="<lilypond staffsize=34>\\absolute {\n\\time "+self.time+"\n\\key "+self.key.gsub("minor", "\\minor").gsub("major", "\\major")+"\n"+self.content+"\n}</lilypond>"
firstpart="./public/uploads/"
simplename="partition"+self.id.to_s
myname=simplename+".html"
File.write(firstpart+myname, @fragment)
@hey=`(cd #{firstpart} && lilypond-book #{myname} -f html --output #{simplename})`
end
def getpic
y=File.read("public/uploads/partition#{id}/partition#{self.id}.html")
"/uploads/partition#{id}/"+Nokogiri::HTML(y).css("img")[0].attributes["src"].value
rescue
""

end

end

