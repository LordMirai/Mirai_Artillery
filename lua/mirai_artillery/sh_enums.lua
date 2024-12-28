MArti = MArti or {}
MArti.Colors = {}

MArti.Colors.White = Color(250, 250, 250)
MArti.Colors.Black = Color(0, 0, 0)
MArti.Colors.Red = Color(250, 0, 0)
MArti.Colors.Green = Color(0, 250, 0)
MArti.Colors.Blue = Color(0, 0, 250)
MArti.Colors.Yellow = Color(250, 250, 0)
MArti.Colors.Purple = Color(250, 0, 250)
MArti.Colors.Orange = Color(250, 150, 0)
MArti.Colors.Indigo = Color(50, 10, 120)


MArti.ShellTypes = {
    HE = {
        Name = "High Explosive",
        Description = "Explodes on impact, dealing damage to nearby entities.",
        Damage = 100,
        Radius = 200,
        Color = MArti.Colors.Red,
        FuzeTime = 0.5,
        AirDetonation = false,
        SelfDestruct = 0,
        ShellType = "HE"
    },
    AP = {
        Name = "Armor Piercing",
        Description = "Penetrates armor, dealing damage to a single entity.",
        Damage = 200,
        Radius = 0,
        Color = MArti.Colors.Green,
        FuzeTime = 0.5,
        AirDetonation = false,
        SelfDestruct = 0,
        ShellType = "AP"
    },
    Smoke = {
        Name = "Smoke",
        Description = "Creates a smoke screen on impact.",
        Damage = 0,
        Radius = 200,
        Color = MArti.Colors.Gray,
        FuzeTime = 1,
        AirDetonation = false,
        SelfDestruct = 0,
        ShellType = "Smoke"
    },
    Flare = {
        Name = "Flare",
        Description = "Illuminates the area on impact.",
        Damage = 0,
        Radius = 200,
        Color = MArti.Colors.Yellow,
        FuzeTime = 0.3,
        AirDetonation = false,
        SelfDestruct = 0,
        ShellType = "Flare"
    },
    Incendiary = {
        Name = "Incendiary",
        Description = "Sets entities on fire on impact.",
        Damage = 50,
        Radius = 100,
        Color = MArti.Colors.Orange,
        FuzeTime = 1,
        AirDetonation = false,
        SelfDestruct = 0,
        ShellType = "Incendiary"
    },
    HESD = {
        Name = "High Explosive Self Destruct",
        Description = "Explodes after a set time, dealing damage to nearby entities.",
        Damage = 100,
        Radius = 200,
        Color = MArti.Colors.Red,
        FuzeTime = 1,
        AirDetonation = true,
        SelfDestruct = 2,
        ShellType = "HESD"
    },
}