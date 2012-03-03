class PagesController < ApplicationController
  def home
    #render :text => Wordnik.words.search_words(:query => 'in*', :min_dictionary_count => 3)
  end

  def gallery1
  end

  def get_word
    #words = Wordnik.words.search_words(:query => 'in*', :case_sensitive => false, :min_dictionary_count => 12, :min_length => 5, :limit => 1000)
    #justWords = []
    #words.each do |word|
      #justWords.push(word['wordstring'])
    #end

justWords = ["information","industry","interest","include","increase","international","involved","inside","investment","insurance","interview","income","individual","independent","influence","intelligence","incident","index","instance","initial","industrial","install","internal","instant","inflation","innocent","initiative","intellectual","invest","intention","intense","indicate","intelligent","integrated","intent","interface","introduction","invasion","innovation","institution","introduce","input","inner","inning","interior","involved","inspiration","integrity","inventory","integration","intend","insight","invitation","installation","intervention","indication","invite","instrument","inform","intimate","infection","interpretation","interim","instruction","intensity","inspire","infanticide","insane","incumbent","insult","invisible","intensive","interference","infinite","instinct","interfere","intersection","innocence","infamous","integrate","inferior","incorrect","invention","inaugural","interrogation","incoming","inclusion","incapable","intellect","indifference","incorporate","institute","informal","interval","injection","inquire","instrumental","installment","interpret","induce","intervene","invalid","inheritance","integral","intuitive","inland","inclination","incompetent","indulge","indispensable","invade","intermediate","inconvenience","infectious","injunction","inequality","initiate","indicative","insect","interruption","ingenious","indefinite","indulgence","invent","inspect","inflated","interrupt","invasive","inflammation","intrusion","incidence","infancy","inscription","intriguing","insulation","inherit","inject","invoke","incur","infusion","instruct","injure","incidental","induction","innate","incarnation","intrinsic","incompatible","interchange","intern","intuition","intercept","incense","intoxication","intrusive","iniquity","individuality","intermission","insidious","infernal","insolent","incendiary","incline","insertion","insensible","insolence","insistent","inverted","infect","infinity","incorporation","infiltrate","inflexible","instrumentation","infringe","inflate","inert","invocation","inverse","inanimate","intimation","intrude","inlet","infidel","intestine","individualism","inflame","indemnity","incorrigible","incubator","incisive","indolent","inhibition","incarnate","infuse","infirm","inarticulate","insular","inflection","inveterate","increment","inversion","insulate","incision","interdict","indigo","interlude","ingenuous","inquisition","insinuate","inaugurate","insinuation","incubation","insoluble","intonation","indisposition",
  "incognito","inductive","invidious","invert","interpolation","indentation","inflected","interlock","indenture","inoculate","indent","incontinent","inscribe","induct","introvert","indorsement","intoxicate","indorse","inwardness","inflorescence","interpolate","inebriate","incrustation","infix","inflect","indurate","infundibulum","intonate","intercourse","inferno","incest","intendo","inception","internet",
  "invulnerable","indeed","inbound","invincible","investigate","inebriated","intoxicated","inventive","incentive","insurrection","insurgency","insatiable","invigoration","interception","intelligence","integer","insomnia","inseminate","innuendo","Inigo Montoya","Indian","inhumane","infuriated","infatuate","income tax","infestation","inertia","influenza","inderella","insecure","infertile"]
    
    respond_to do |format|
      r = rand(justWords.length)
      format.js { render(:json => justWords[r]) }
    end
  end

end
