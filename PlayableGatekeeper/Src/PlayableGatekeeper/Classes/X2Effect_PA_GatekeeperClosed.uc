class X2Effect_PA_GatekeeperClosed extends X2Effect_PersistentStatChange config(GameData_Effect);

var config float PA_GATEKEEPER_CLOSED_PERCENT_DAMAGE_REDUCTION;

function int GetDefendingDamageModifier(XComGameState_Effect EffectState, XComGameState_Unit Attacker, Damageable TargetDamageable, XComGameState_Ability AbilityState, 
										const out EffectAppliedData AppliedData, const int CurrentDamage, X2Effect_ApplyWeaponDamage WeaponDamageEffect, optional XComGameState NewGameState)
{
	local int ModifiedDamage;

	ModifiedDamage = CurrentDamage * default.PA_GATEKEEPER_CLOSED_PERCENT_DAMAGE_REDUCTION;

	return ModifiedDamage;
}

defaultproperties
{
	bDisplayInSpecialDamageMessageUI = true
}
