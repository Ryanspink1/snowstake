class Seed
  def self.start
    seed = Seed.new
    seed.destroy_data
    seed.seed_resorts
  end

  def initialize
    @resorts = [
      [1, "Arapahoe Basin", "https://www.arapahoebasin.com/webcams/abasincam6000m.jpg", "2"],
      [2, "Aspen Snowmass", "https://www.aspensnowmass.com/CamImages/Snow_Stake_Cam.jpg", "24"],
      [3, "Beaver Creek", "http://common.snow.com/Mtncams/bcsnowstake.jpg", "5"],
      [4, "Breckenridge", "http://common.snow.com/Mtncams/brecksnowstake.jpg", "6"],
      [5, "Copper Mountain","https://b7b.hdrelay.com/cameras/fb469125-f1f3-459f-aeb4-98cb674e395f/GetOneShot?size=800x450&f=300000", "7"],
      [6, "Crested Butte","http://skicb.server310.com/ftp/powcam/pow.jpg", "8"],
      [7, "Keystone","http://common.snow.com/Mtncams/KeySnowStake.jpg", "3"],
      [8, "Loveland","http://photosskiloveland.com/Report/15minutes/data.jpg", "1"],
      [9, "Powderhorn", "http://www.powderhorn.com/cams/netcam1-000001.jpg", "12"],
      [10, "Steamboat","https://b7b.hdrelay.com/cameras/e12dbfe2-9359-4b93-a8ce-b5e461b681d1/GetOneShot?size=1920x1080&f=300000", "13"],
      [11, "Telluride","http://www.tellurideskiresort.com/webcams/powcam.jpg", "14"],
      [12, "Vail","http://common.snow.com/Mtncams/vailsnowstake.jpg", "15"],
      [13, "Winter Park","http://cams.winterparkresort.com/snow-stake-cam.jpg", "16"],
    ]
  end

  def destroy_data
    Resort.destroy_all
  end

  def seed_resorts
    @resorts.each do |resort|
      Resort.create(id: resort[0], name: resort[1], snowstake_url: resort[2], open_snow_id: resort[3])
      puts "created #{resort[1]}"
    end
  end
end

Seed.start
