module StatsHelper

  def name_for(stat)
    name = Dota::Data.new(stat.account_id).mmr["profile"]["name"]
  end

  def wins_for(stat)
    wins = Dota::Data.new(stat.account_id).record["win"]
  end

  def losses_for(stat)
    losses = Dota::Data.new(stat.account_id).record["lose"]
  end

  def mmr_for(stat)
    mmr = Dota::Data.new(stat.account_id).mmr["mmr_estimate"]["estimate"]
  end

  def hours_played_for(stat)
    total_time = 0
    matches = Dota::Data.new(stat.account_id).matches
    matches.each do |game|
      total_time += time_converter(game.fetch("duration"))
    end
    total_time.round
  end

  def time_converter(time)
    time = time.to_s
    seconds = time[0..1].to_i * 60
    seconds += time[2..3].to_i
    hours = (seconds.to_f/3600).floor(2) #time in hours, 3600 seconds = 1 hour
  end

  def heroes_for(stat)
    heroes = Dota::Data.new(stat.account_id).heroes
    i = 0
    top_3 = []
    while i < 3
      top_3 << heroes[i]["hero_id"]
      i +=1
    end
    top_3
  end

  def top_3(stat)
    heroes = Dota::Data.new(stat.account_id).heroes
    i = 0
    top_3 = []
    while i < 3
      top_3 << heroes[i]["hero_id"]
      i +=1
    end
    top_3
  end

  def hero1(stat)
    first_hero = library(top_3(stat)[0].to_s)
    first_hero
  end

  def hero2(stat)
    second_hero = library(top_3(stat)[1].to_s)
    second_hero
  end

  def hero3(stat)
    three_hero = library(top_3(stat)[2].to_s)
    three_hero
  end

  def library(id)
    heroes_lib = {
      "1"  => "antimage",
      "2"  => "axe",
      "3"  => "bane",
      "4"  => "bloodseeker",
      "5"  => "crystal_maiden",
      "6"  => "drow_ranger",
      "7"  => "earthshaker",
      "8"  => "juggernaut",
      "9"  => "mirana",
      "10" => "morphling",
      "11" => "nevermore",
      "12" => "phantom_lancer",
      "13" => "puck",
      "14" => "pudge",
      "15" => "razor",
      "16" => "sand_king",
      "17" => "storm_spirit",
      "18" => "sven",
      "19" => "tiny",
      "20" => "vengefulspirit",
      "21" => "windrunner",
      "22" => "zuus",
      "23" => "kunkka",
      "24" => "",
      "25" => "lina",
      "26" => "lion",
      "27" => "shadow_shaman",
      "28" => "slardar",
      "29" => "tidehunter",
      "30" => "witch_doctor",
      "31" => "lich",
      "32" => "riki",
      "33" => "enigma",
      "34" => "tinker",
      "35" => "sniper",
      "36" => "necrolyte",
      "37" => "warlock",
      "38" => "beastmaster",
      "39" => "queenofpain",
      "40" => "venomancer",
      "41" => "faceless_void",
      "42" => "skeleton_king",
      "43" => "death_prophet",
      "44" => "phantom_assassin",
      "45" => "pugna",
      "46" => "templar_assassin",
      "47" => "viper",
      "48" => "luna",
      "49" => "dragon_knight",
      "50" => "dazzle",
      "51" => "rattletrap",
      "52" => "leshrac",
      "53" => "furion",
      "54" => "life_stealer",
      "55" => "dark_seer",
      "56" => "clinkz",
      "57" => "omniknight",
      "58" => "enchantress",
      "59" => "huskar",
      "60" => "night_stalker",
      "61" => "broodmother",
      "62" => "bounty_hunter",
      "63" => "weaver",
      "64" => "jakiro",
      "65" => "batrider",
      "66" => "chen",
      "67" => "spectre",
      "68" => "ancient_apparition",
      "69" => "doom_bringer",
      "70" => "ursa",
      "71" => "spirit_breaker",
      "72" => "gyrocopter",
      "73" => "alchemist",
      "74" => "invoker",
      "75" => "silencer",
      "76" => "obsidian_destroyer",
      "77" => "lycan",
      "78" => "brewmaster",
      "79" => "shadow_demon",
      "80" => "lone_druid",
      "81" => "chaos_knight",
      "82" => "meepo",
      "83" => "treant",
      "84" => "ogre_magi",
      "85" => "undying",
      "86" => "rubick",
      "87" => "disruptor",
      "88" => "nyx_assassin",
      "89" => "naga_siren",
      "90" => "keeper_of_the_light",
      "91" => "wisp",
      "92" => "visage",
      "93" => "slark",
      "94" => "medusa",
      "95" => "troll_warlord",
      "96" => "centaur",
      "97" => "magnataur",
      "98" => "shredder",
      "99" => "bristleback",
      "100" => "tusk",
      "101" => "skywrath_mage",
      "102" => "abaddon",
      "103" => "elder_titan",
      "104" => "legion_commander",
      "105" => "techies",
      "106" => "ember_spirit",
      "107" => "earth_spirit",
      "108" => "abyssal_underlord",
      "109" => "terrorblade",
      "110" => "phoenix",
      "111" => "oracle",
      "112" => "winter_wyvern",
      "113" => "arc_warden"
    }
    heroes_lib[id]
  end

end
