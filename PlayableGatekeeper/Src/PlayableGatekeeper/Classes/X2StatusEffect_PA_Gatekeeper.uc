class X2StatusEffect_PA_Gatekeeper extends Object 

var localized string PA_GatekeeperClosedEffectDesc;

static function X2Effect_PersistentStatChange CreatePA_GatekeeperClosedEffect()
{
	local X2Effect_PersistentStatChange PA_GatekeeperClosedEffect;

	PA_GatekeeperClosedEffect = new class 'X2Effect_PA_GatekeeperClosed';
	PA_GatekeeperClosedEffect.EffectName = class'X2Ability_Gatekeeper'.default.ClosedEffectName;
	PA_GatekeeperClosedEffect.DuplicateResponse = eDupe_Ignore;
	PA_GatekeeperClosedEffect.BuildPersistentEffect(1, true);
	PA_GatekeeperClosedEffect.SetDisplayInfo(ePerkBuff_Bonus, default.PA_GatekeeperClosedEffectName, default.PA_GatekeeperClosedEffectDesc, "img:///UILibrary_PerkIcons.UIPerk_gatekeeper_shut");
	PA_GatekeeperClosedEffect.AddPersistentStatChange(eStat_ArmorMitigation,  default.PA_Gatekeeper_ClosedArmor_Adjust);
	PA_GatekeeperClosedEffect.AddPersistentStatChange(eStat_ArmorChance,  default.PA_Gatekeeper_ClosedArmorChance_Adjust);
	PA_GatekeeperClosedEffect.AddPersistentStatChange(eStat_SightRadius, default.PA_Gatekeeper_ClosedSight_Adjust);
	PA_GatekeeperClosedEffect.AddPersistentStatChange(eStat_Defense, default.PA_Gatekeeper_ClosedDefense_Adjust);

	return PA_GatekeeperClosedEffect;
}




