# Hardpoint Generator for Empire at War

TEMPLATE = """<HardPoint Name="{hp_name}">
    <Type> HARD_POINT_WEAPON_LASER </Type>
    <Is_Targetable>Yes</Is_Targetable>
    <Is_Destroyable>Yes</Is_Destroyable>
    <Tooltip_Text>TEXT_WEAPON_TURBOLASER</Tooltip_Text>
    <Health>600.0</Health>
    <Death_Explosion_Particles> Large_Explosion_Space </Death_Explosion_Particles>
    <Death_Explosion_SFXEvent>Unit_Hardpoint_Turbo_Laser_Death</Death_Explosion_SFXEvent>
    <Model_To_Attach></Model_To_Attach>
    <Attachment_Bone>{bone}</Attachment_Bone>
    <Collision_Mesh>{bone}</Collision_Mesh>
    <Damage_Decal></Damage_Decal>
    <Damage_Particles></Damage_Particles>
    <Death_Breakoff_Prop></Death_Breakoff_Prop>
    <Damage_Type> Damage_Star_Destroyer </Damage_Type>
    <Fire_Bone_A>{bone}</Fire_Bone_A>
    <Fire_Bone_B>{bone}</Fire_Bone_B>
    <Fire_Cone_Width>175.0</Fire_Cone_Width>
    <Fire_Cone_Height>160.0</Fire_Cone_Height>
    <Fire_Projectile_Type>Proj_Ship_Turbolaser_Red</Fire_Projectile_Type>
    <Fire_Min_Recharge_Seconds>3.0</Fire_Min_Recharge_Seconds>
    <Fire_Max_Recharge_Seconds>4.0</Fire_Max_Recharge_Seconds>
    <Fire_Pulse_Count>4</Fire_Pulse_Count>
    <Fire_Pulse_Delay_Seconds>0.2</Fire_Pulse_Delay_Seconds>
    <Fire_Range_Distance>1500.0</Fire_Range_Distance>
    <Fire_SFXEvent>Unit_Turbo_Fire</Fire_SFXEvent>
    <Fire_Inaccuracy_Distance> Fighter, 70.0 </Fire_Inaccuracy_Distance>
    <Fire_Inaccuracy_Distance> Bomber, 70.0 </Fire_Inaccuracy_Distance>
    <Fire_Inaccuracy_Distance> Transport, 70.0 </Fire_Inaccuracy_Distance>
    <Fire_Inaccuracy_Distance> Corvette, 1.0 </Fire_Inaccuracy_Distance>
    <Fire_Inaccuracy_Distance> Frigate, 15.0 </Fire_Inaccuracy_Distance>
    <Fire_Inaccuracy_Distance> Capital, 70.0 </Fire_Inaccuracy_Distance>
    <Fire_Inaccuracy_Distance> Super, 30.0 </Fire_Inaccuracy_Distance>
</HardPoint>"""


def generate_hardpoints(
    output_file="Hardpoints_Procurator.xml",
    hp_prefix="HP_Procurator_",
    bone_prefix="MuzzleB_",
    start=00,
    end=17,
    padding=2
):
    hardpoints = []

    for i in range(start, end + 1):
        num = str(i).zfill(padding)
        hp_name = f"{hp_prefix}{num}"
        bone = f"{bone_prefix}{num}"

        hardpoints.append(TEMPLATE.format(
            hp_name=hp_name,
            bone=bone
        ))

    with open(output_file, "w") as f:
        f.write("\n\n".join(hardpoints))

    print(f"Generated {end - start + 1} hardpoints → {output_file}")


# ==== RUN HERE ====
if __name__ == "__main__":
    generate_hardpoints(
        output_file="Hardpoints_Procurator.xml",
        hp_prefix="HP_Procurator_",
        bone_prefix="MuzzleB_",
        start=00,
        end=17,
        padding=2
    )
