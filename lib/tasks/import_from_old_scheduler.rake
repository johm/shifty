
namespace :scheduler do
  desc "Import from old scheduler"
  task :import => :environment do
    olddb=SQLite3::Database.new("/home/john/shifty/production.sqlite")
    
    worker_map = {	
      "" => "",
      "?" => "",
      "???" => "",
      "Andrea" => "Andrea Calderon",
      "Anyone available?" => "",
      "Back to School Night" => "",
      "Baltimore Free School Organizing meeting" => "",
      "Barista Meeting (Time?)" => "",
      "Black Feminism and Intersectionality" => "",
      "Bolt" => "Tabolt Johnson",
      "Books Department" => "",
      "Books Meeting" => "",
      "Casey" => "Casey McKeel",
      "Casey/Kata" => "",
      "Charles Cobb: This Nonviolent Stuff Will Get You Killed" => "",
      "Chelsea" => "Chelsea Gleason",
      "Cherry" => "Cherry Lau",
      "Christa" => "Christa Daring",
      "Closed New Years Day" => "",
      "Closed New Years Eve" => "",
      "Closed" => "",
      "Coffee Cupping Event" => "",
      "Collective Meeting" => "",
      "Cooks Meeting" => "",
      "Cullen" => "Cullen Nawalkowsky",
      "DAY AFTER XMAS CLOSED" =>"",
      "Differently Abled Me Back to School Night" => "",
      "EVENT" => "",
      "EVENT: Sex Itself" => "",
      "Educating for Insurgency Book Release" => "",
      "Event Bicycle Diaries" => "",
      "Event Companeras" => "",
      "Event TTIPTAFTA" => "",
      "Event: $pread Magazine" => "",
      "Event: Ai-Jen Poo" => "",
      "Event: Chris Dixon" => "",
      "Event: Curationism" => "",
      "Event: David Roediger" => "",
      "Food Meeting" => "",
      "Free School: Emotional Freedom Techniques" => "",
      "Free School: Marx's Capital Illustrated" => "",
      "GAbby" => "Gabby Vigo",
      "Gabby" => "Gabby Vigo",
      "Gabby? Kevin?  New Person?" => "",
      "Gentrification (K)Not Screening" => "",
      "Gomez Talk" => "",
      "Greece Update" => "",
      "HoC Setup" => "",
      "HoC Taping" => "",
      "I am not a test score" => "",
      "Iris" => "Irxs Kirsch",
      "Irxs" => "Irxs Kirsch",
      "JEBUS" => "",
      "JOSIAH" => "Josiah Morgan",
      "Jacobin Reading Group" => "",
      "Jasmine" => "Jasmine Kumalah",
      "Jenn FOH training" => "Jenn Messier",
      "Jenn" => "Jenn Messier",
      "Jess Row Presents Your Face in Mine" => "",
      "Josiah" => "Josiah Morgan",
      "K FROOM" => "K Froom",
      "K Froom" => "K Froom",
      "K" => "K Froom",
      "K?" => "",
      "KDunn (OPEN)" => "",
      "KDunn" => "Kate Dunn",
      "KDunn/Josiah" => "",
      "KFROOM" => "K Froom",
      "KFroom" => "K Froom",
      "Kaitlin" => "K Froom",
      "Kata" => "Kata Frederick",
      "Kata/Casey" => "",
      "Kate D" => "Kate Dunn",
      "Kate D." => "Kate Dunn",
      "Kate Dunn" => "Kate Dunn",
      "Kate" => "Kate Khatib",
      "Kate/Christa/Lanie/Tim/Kate D rotate" => "",
      "Kelvin" => "Kelvin Pittman",
      "Ken Brown" => "Ken Brown",
      "Ken" => "Ken Brown",
      "Kevin" => "Kevin Blackistone",
      "Kevin?" => "",
      "Kfroom" => "K Froom",
      "LBS event" => "",
      "LaKeyma" => "Lakeyma Pennyamon",
      "Lakeyma" => "Lakeyma Pennyamon",
      "Lanie" => "Lanie Thomas",
      "Lanie/Tim/Ryan" => "",
      "Lunch Breaks" => "",
      "MAY DAY" => "",
      "Machete" => "Machete Mendias",
      "Maddie" => "Maddie Hicks",
      "May Day!" => "",
      "Michelle" => "Michelle Fleming",
      "Monthly IWW GMB Meeting" => "",
      "NEED SOMEONE" => "",
      "Need Someone" => "",
      "Need someone" => "",
      "Networking Your Way to a New Job" => "",
      "New Person" => "",
      "OPEN" => "",
      "One State Solution in Palestine" => "",
      "Open Shift (Rose)" => "",
      "Open Shift (cover Machete)" => "",
      "PAH event in Free School" => "",
      "Pip" => "Ava Pipitone",
      "Promo" => "",
      "Public Safety Collective (Free School)" => "",
      "Public Safety Collective" => "",
      "Reading Group: Marx's Capital Illustrated" => "",
      "Reggie" => "Reggie Simms",
      "Research Associates Foundation Information Session" => "",
      "Retreat" => "",
      "Roaster Maintence" => "",
      "Rose" => "Rose McIntyre",
      "Roxanne DunbarOrtiz" => "",
      "Ryan" => "Ryan Harvey",
      "Ryan" => "Ryan Harvey",
      "SUMMER VACATION" => "",
      "Self Love Bibles" => "",
      "Shola" => "Shola Cole",
      "Short Days or More Admin" => "",
      "Social Justice Poetry Workshops for Youth" => "",
      "Somebody who wants more hours" => "",
      "Spencer" => "Spencer Compton",
      "Squatter Road Show" => "",
      "Suzanne" => "Suzanne Shaffer",
      "Teacher Union Talk" => "",
      "Testing Resistance and Refusal" => "",
      "Tiffany" => "Tiffany Defoe",
      "Tim" => "Tim Meysenburg",
      "Tim/Lanie/Kate/Jenn rotate" => "",
      "Turkeys" => "",
      "Wisconsin Rising " => "",
      "XMAS CLOSED" => "",
      "Zine Release Event Hoax 10" => "",
      "Zine Release Venet: Hoax #10" => "",
      "andrea" => "Andrea Calderon",
      "casey" => "Casey McKeel",
      "catalyst con" => "",
      "chelsea" => "Chelsea Gleason",
      "cherry" => "Cherry Lau",
      "christa" => "Christa Daring",
      "cullen" => "Cullen Nawalkowsky",
      "intersections" => "",
      "irxs" => "Irxs Kirsch",
      "jasmine" => "Jasmine Kumalah",
      "jenn" => "Jenn Messier",
      "john" => "John Duda",
      "k froom" => "K Froom",
      "kata" => "Kata Frederick",
      "kate" => "Kate Khatib",
      "kelvin" => "Kelvin Pittman",
      "ken" => "Ken Brown",
      "kevin" => "Kevin Blackistone",
      "kfroom" => "K Froom",
      "lanie" => "Lanie Thomas",
      "machete" => "Machete Mendias",
      "michelle" => "Michelle Fleming",
      "naomi murakawa" => "",
      "new person" => "",
      "reggie" => "Reggie Simms",
      "rose" => "Rose McIntyre",
      "rotating shift" => "",
      "ryan" => "Ryan Harvey",
      "spencer" => "Spencer Compton",
      "suzanne but also probably kaitlin" => "",
      "suzanne" => "Suzanne Shaffer",
      "tiffany" => "Tiffany Defoe",
      "tim" => "Tim Meysenburg",
      "Suzanne - check in" => ""}
    
    
    acceptable_shifts=["Bookseller 1", "Roaster", "Sandwich", "Barista 1", "Barista 2", "Bookseller 2", "Kitchen Prep", "Line Cook", "Barista 3", "Front of House", "Propub", "Infrastructure", "Development", "Events"]
    
    shifts_to_task={
      "Bookseller 1" => "Bookseller", 
      "Roaster" => "Roaster", 
      "Sandwich" => "Sandwich", 
      "Barista 1" => "Barista", 
      "Barista 2" => "Barista", 
      "Bookseller 2" => "Bookseller", 
      "Kitchen Prep" => "Prep", 
      "Line Cook" => "Line", 
      "Barista 3" => "Barista",
      "Front of House" => "Front of House", 
      "Propub" => "Propub", 
      "Infrastructure" => "Infrastructure", 
      "Development" => "Development",
      "Events" => "Events"}

    task_to_workgroup = {
      "Barista" => "FOH",
      "Bookseller" => "Books",
      "Roaster" => "Thread",
      "Sandwich" => "Kitchen",
      "Prep" => "Kitchen",
      "Line" => "Kitchen",
      "Front of House" => "FOH",
      "Propub" => "Propub",
      "Infrastructure" => "Backend",
      "Events" => "Propub",
      "Development" => "Backend"}
      
    #[5, "2013-11-01", "Initial shift template", 0.0]
    olddb.execute("SELECT * from weeks").each do |oldweek|
      old_week_id=oldweek[0]
      old_week_monday=oldweek[1]
      old_week_template_name=oldweek[2]
      puts old_week_template_name
      if old_week_template_name.blank?
        monday=old_week_monday
      else
        shift_template=ShiftTemplate.where(name: old_week_template_name).first_or_create
      end
      
      olddb.execute("SELECT * from shifts where week_id = #{old_week_id}").find_all {|s| acceptable_shifts.include? s[7]}.each do |shift|
        day_of_week=shift[4]-1
        shiftblock=shift[7]
        workername=shift[12].strip
        description=shift[13]
        start_time="#{shift[8]}:#{shift[10] == 1 ? '30' : '00'}"
        end_time="#{shift[11] == 1 ? shift[9] +1 : shift[9] }:#{shift[11]  == 1 ? '00' : '30'}" 
        end_time ="00:00" if end_time=="24:30" || end_time == "24:00" || end_time=="25:30" || end_time=="25:00"
        start_time ="00:00" if start_time=="24:00" 
        
        
        if ! worker_map[workername].blank?        
          task=
            Task.find_by_name(shifts_to_task[shiftblock]) || 
            Task.create(:name => shifts_to_task[shiftblock],
                        :workgroup => (Workgroup.find_by_name(task_to_workgroup[shifts_to_task[shiftblock]]) || 
                                       Workgroup.create(:name=> task_to_workgroup[shifts_to_task[shiftblock]])))
          
          puts "#{shift[0]}: #{start_time} -> #{end_time}"
          workername=worker_map[workername]
          puts workername
          Shift.new(:task => task,
                       :worker => Worker.where(:firstname => workername).first_or_create,
             :description => description,
             :day_of_week => day_of_week,
             :start_time => start_time,
             :end_time => end_time,
             :monday => monday,
             :shift_template => shift_template
            ).save!
        end
      end
    end
  end
end	   














