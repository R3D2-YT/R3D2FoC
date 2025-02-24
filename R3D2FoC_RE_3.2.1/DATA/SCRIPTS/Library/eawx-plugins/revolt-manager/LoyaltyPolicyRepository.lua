LoyaltyPolicyRepository = {
    DEFAULT = function(planet)
        local preferred_owner = Find_Player("Warlords")
        if planet:get_owner() == Find_Player("Warlords") then
            preferred_owner = Find_Player("Rebel")
        end

        return preferred_owner
    end
}

---@param planet Planet
function LoyaltyPolicyRepository.adumar(planet)
    local preferred_owner = Find_Player("Warlords")
    if planet:get_owner() == Find_Player("Rebel") then
        preferred_owner = Find_Player("Empire")
	elseif planet:get_owner() == Find_Player("Empire") then
        preferred_owner = Find_Player("Rebel")
    end

    return preferred_owner
end

---@param planet Planet
function LoyaltyPolicyRepository.agamar(planet)
    local preferred_owner = Find_Player("Rebel")
    if planet:get_owner() == Find_Player("Rebel") then
        preferred_owner = Find_Player("Warlords")
    end

    return preferred_owner
end

---@param planet Planet
function LoyaltyPolicyRepository.agomar(planet)
    local preferred_owner = Find_Player("Rebel")
    if planet:get_owner() == Find_Player("Rebel") then
        preferred_owner = Find_Player("Warlords")
    end

    return preferred_owner
end

---@param planet Planet
function LoyaltyPolicyRepository.alderaan_graveyard(planet)
    local preferred_owner = Find_Player("Rebel")
    if planet:get_owner() == Find_Player("Rebel") then
        preferred_owner = Find_Player("Warlords")
    end

    return preferred_owner
end

---@param planet Planet
function LoyaltyPolicyRepository.anaxes(planet)
    local preferred_owner = Find_Player("Empire")
    if planet:get_owner() == Find_Player("Empire") then
        preferred_owner = Find_Player("Warlords")
    end

    return preferred_owner
end

---@param planet Planet
function LoyaltyPolicyRepository.ando(planet)
    local preferred_owner = Find_Player("Rebel")
    if planet:get_owner() == Find_Player("Rebel") then
        preferred_owner = Find_Player("Warlords")
    end

    return preferred_owner
end

---@param planet Planet
function LoyaltyPolicyRepository.atchorb(planet)
    local preferred_owner = Find_Player("Corporate_Sector")
    if planet:get_owner() == Find_Player("Corporate_Sector") then
        preferred_owner = Find_Player("Warlords")
    end

    return preferred_owner
end

---@param planet Planet
function LoyaltyPolicyRepository.atravis(planet)
    local preferred_owner = Find_Player("Rebel")
    if planet:get_owner() == Find_Player("Rebel") then
        preferred_owner = Find_Player("Warlords")
    end

    return preferred_owner
end

---@param planet Planet
function LoyaltyPolicyRepository.atzerri(planet)
    local preferred_owner = Find_Player("Rebel")
    if planet:get_owner() == Find_Player("Rebel") then
        preferred_owner = Find_Player("Warlords")
    end

    return preferred_owner
end

---@param planet Planet
function LoyaltyPolicyRepository.axxila(planet)
    local preferred_owner = Find_Player("Empire")
    if planet:get_owner() == Find_Player("Empire") then
        preferred_owner = Find_Player("Warlords")
    end

    return preferred_owner
end

---@param planet Planet
function LoyaltyPolicyRepository.bandomeer(planet)
    local preferred_owner = Find_Player("Rebel")
    if planet:get_owner() == Find_Player("Rebel") then
        preferred_owner = Find_Player("Warlords")
    end

    return preferred_owner
end

---@param planet Planet
function LoyaltyPolicyRepository.barab(planet)
    local preferred_owner = Find_Player("Rebel")
    if planet:get_owner() == Find_Player("Rebel") then
        preferred_owner = Find_Player("Warlords")
    end

    return preferred_owner
end

---@param planet Planet
function LoyaltyPolicyRepository.bastion(planet)
    local preferred_owner = Find_Player("Empire")
    if planet:get_owner() == Find_Player("Empire") then
        preferred_owner = Find_Player("Warlords")
    end

    return preferred_owner
end

---@param planet Planet
function LoyaltyPolicyRepository.bescane(planet)
    local preferred_owner = Find_Player("Empire")
    if planet:get_owner() == Find_Player("Empire") then
        preferred_owner = Find_Player("Warlords")
    end

    return preferred_owner
end

---@param planet Planet
function LoyaltyPolicyRepository.bespin(planet)
    local preferred_owner = Find_Player("Rebel")
    if planet:get_owner() == Find_Player("Rebel") then
        preferred_owner = Find_Player("Warlords")
    end

    return preferred_owner
end

---@param planet Planet
function LoyaltyPolicyRepository.bestine(planet)
    local preferred_owner = Find_Player("Rebel")
    if planet:get_owner() == Find_Player("Rebel") then
        preferred_owner = Find_Player("Warlords")
    end

    return preferred_owner
end

---@param planet Planet
function LoyaltyPolicyRepository.bilbringi(planet)
    local preferred_owner = Find_Player("Warlords")
    if planet:get_owner() == Find_Player("Rebel") then
        preferred_owner = Find_Player("Empire")
	elseif planet:get_owner() == Find_Player("Empire") then
        preferred_owner = Find_Player("Rebel")
    end

    return preferred_owner
end

---@param planet Planet
function LoyaltyPolicyRepository.bonadan(planet)
    local preferred_owner = Find_Player("Corporate_Sector")
    if planet:get_owner() == Find_Player("Corporate_Sector") then
        preferred_owner = Find_Player("Warlords")
    end

    return preferred_owner
end

---@param planet Planet
function LoyaltyPolicyRepository.bormus(planet)
    local preferred_owner = Find_Player("Rebel")
    if planet:get_owner() == Find_Player("Rebel") then
        preferred_owner = Find_Player("Warlords")
    end

    return preferred_owner
end

---@param planet Planet
function LoyaltyPolicyRepository.byss(planet)
    local preferred_owner = Find_Player("Empire")
    if planet:get_owner() == Find_Player("Empire") then
        preferred_owner = Find_Player("Warlords")
    end

    return preferred_owner
end

---@param planet Planet
function LoyaltyPolicyRepository.ord_cantrell(planet)
    local preferred_owner = Find_Player("Empire")
    if planet:get_owner() == Find_Player("Empire") then
        preferred_owner = Find_Player("Warlords")
    end

    return preferred_owner
end

---@param planet Planet
function LoyaltyPolicyRepository.carida(planet)
    local preferred_owner = Find_Player("Empire")
    if planet:get_owner() == Find_Player("Empire") then
        preferred_owner = Find_Player("Warlords")
    end

    return preferred_owner
end

---@param planet Planet
function LoyaltyPolicyRepository.castell(planet)
    local preferred_owner = Find_Player("Rebel")
    if planet:get_owner() == Find_Player("Rebel") then
        preferred_owner = Find_Player("Warlords")
    end

    return preferred_owner
end

---@param planet Planet
function LoyaltyPolicyRepository.centares(planet)
    local preferred_owner = Find_Player("Greater_Maldrood")
    if planet:get_owner() == Find_Player("Greater_Maldrood") then
        preferred_owner = Find_Player("Warlords")
    end

    return preferred_owner
end

---@param planet Planet
function LoyaltyPolicyRepository.champala(planet)
    local preferred_owner = Find_Player("Rebel")
    if planet:get_owner() == Find_Player("Rebel") then
        preferred_owner = Find_Player("Warlords")
    end

    return preferred_owner
end

---@param planet Planet
function LoyaltyPolicyRepository.chandrila(planet)
    local preferred_owner = Find_Player("Rebel")
    if planet:get_owner() == Find_Player("Rebel") then
        preferred_owner = Find_Player("Warlords")
    end

    return preferred_owner
end

---@param planet Planet
function LoyaltyPolicyRepository.chardaan(planet)
    local preferred_owner = Find_Player("Rebel")
    if planet:get_owner() == Find_Player("Rebel") then
        preferred_owner = Find_Player("Warlords")
    end

    return preferred_owner
end

---@param planet Planet
function LoyaltyPolicyRepository.charubah(planet)
    local preferred_owner = Find_Player("Hapes_Consortium")
    if planet:get_owner() == Find_Player("Hapes_Consortium") then
        preferred_owner = Find_Player("Warlords")
    end

    return preferred_owner
end

---@param planet Planet
function LoyaltyPolicyRepository.chasin(planet)
    local preferred_owner = Find_Player("Empire")
    if planet:get_owner() == Find_Player("Empire") then
        preferred_owner = Find_Player("Warlords")
    end

    return preferred_owner
end

---@param planet Planet
function LoyaltyPolicyRepository.chronde(planet)
    local preferred_owner = Find_Player("Rebel")
    if planet:get_owner() == Find_Player("Rebel") then
        preferred_owner = Find_Player("Warlords")
    end

    return preferred_owner
end

---@param planet Planet
function LoyaltyPolicyRepository.clakdor(planet)
    local preferred_owner = Find_Player("Rebel")
    if planet:get_owner() == Find_Player("Rebel") then
        preferred_owner = Find_Player("Warlords")
    end

    return preferred_owner
end

---@param planet Planet
function LoyaltyPolicyRepository.columex(planet)
    local preferred_owner = Find_Player("Empire")
    if planet:get_owner() == Find_Player("Empire") then
        preferred_owner = Find_Player("Warlords")
    end

    return preferred_owner
end

---@param planet Planet
function LoyaltyPolicyRepository.commenor(planet)
    local preferred_owner = Find_Player("Warlords")
    if planet:get_owner() == Find_Player("Rebel") then
        preferred_owner = Find_Player("Empire")
	elseif planet:get_owner() == Find_Player("Empire") then
        preferred_owner = Find_Player("Rebel")
    end

    return preferred_owner
end

---@param planet Planet
function LoyaltyPolicyRepository.contruum(planet)
    local preferred_owner = Find_Player("Rebel")
    if planet:get_owner() == Find_Player("Rebel") then
        preferred_owner = Find_Player("Warlords")
    end

    return preferred_owner
end

---@param planet Planet
function LoyaltyPolicyRepository.corulag(planet)
    local preferred_owner = Find_Player("Empire")
    if planet:get_owner() == Find_Player("Empire") then
        preferred_owner = Find_Player("Warlords")
    end

    return preferred_owner
end

---@param planet Planet
function LoyaltyPolicyRepository.cularin(planet)
    local preferred_owner = Find_Player("Warlords")
    if planet:get_owner() == Find_Player("Rebel") then
        preferred_owner = Find_Player("Empire")
	elseif planet:get_owner() == Find_Player("Empire") then
        preferred_owner = Find_Player("Rebel")
    end

    return preferred_owner
end

---@param planet Planet
function LoyaltyPolicyRepository.dathomir(planet)
    local preferred_owner = Find_Player("Hapes_Consortium")
    if planet:get_owner() == Find_Player("Hapes_Consortium") then
        preferred_owner = Find_Player("Warlords")
    end

    return preferred_owner
end

---@param planet Planet
function LoyaltyPolicyRepository.denon(planet)
    local preferred_owner = Find_Player("Empire")
    if planet:get_owner() == Find_Player("Empire") then
        preferred_owner = Find_Player("Warlords")
    end

    return preferred_owner
end

---@param planet Planet
function LoyaltyPolicyRepository.devaron(planet)
    local preferred_owner = Find_Player("Empire")
    if planet:get_owner() == Find_Player("Empire") then
        preferred_owner = Find_Player("Warlords")
    end

    return preferred_owner
end

---@param planet Planet
function LoyaltyPolicyRepository.dolomar(planet)
    local preferred_owner = Find_Player("Rebel")
    if planet:get_owner() == Find_Player("Rebel") then
        preferred_owner = Find_Player("Warlords")
    end

    return preferred_owner
end

---@param planet Planet
function LoyaltyPolicyRepository.dromund(planet)
    local preferred_owner = Find_Player("Empire")
    if planet:get_owner() == Find_Player("Empire") then
        preferred_owner = Find_Player("Warlords")
    end

    return preferred_owner
end

---@param planet Planet
function LoyaltyPolicyRepository.druckenwell(planet)
    local preferred_owner = Find_Player("Warlords")
    if planet:get_owner() == Find_Player("Rebel") then
        preferred_owner = Find_Player("Empire")
	elseif planet:get_owner() == Find_Player("Empire") then
        preferred_owner = Find_Player("Rebel")
    end

    return preferred_owner
end

---@param planet Planet
function LoyaltyPolicyRepository.duro(planet)
    local preferred_owner = Find_Player("Rebel")
    if planet:get_owner() == Find_Player("Rebel") then
        preferred_owner = Find_Player("Warlords")
    end

    return preferred_owner
end

---@param planet Planet
function LoyaltyPolicyRepository.elrood(planet)
    local preferred_owner = Find_Player("Empire")
    if planet:get_owner() == Find_Player("Empire") then
        preferred_owner = Find_Player("Warlords")
    end

    return preferred_owner
end

---@param planet Planet
function LoyaltyPolicyRepository.endor(planet)
local preferred_owner = Find_Player("Rebel")
    if planet:get_owner() == Find_Player("Rebel") then
        preferred_owner = Find_Player("Warlords")
    end

    return preferred_owner
end

---@param planet Planet
function LoyaltyPolicyRepository.eriadu(planet)
    local preferred_owner = Find_Player("Eriadu_Authority")
    if planet:get_owner() == Find_Player("Eriadu_Authority") then
        preferred_owner = Find_Player("Empire")
    end

    return preferred_owner
end

---@param planet Planet
function LoyaltyPolicyRepository.ession(planet)
    local preferred_owner = Find_Player("Corporate_Sector")
    if planet:get_owner() == Find_Player("Corporate_Sector") then
        preferred_owner = Find_Player("Warlords")
    end

    return preferred_owner
end

---@param planet Planet
function LoyaltyPolicyRepository.etti(planet)
    local preferred_owner = Find_Player("Corporate_Sector")
    if planet:get_owner() == Find_Player("Corporate_Sector") then
        preferred_owner = Find_Player("Warlords")
    end

    return preferred_owner
end

---@param planet Planet
function LoyaltyPolicyRepository.farrfin(planet)
    local preferred_owner = Find_Player("Rebel")
    if planet:get_owner() == Find_Player("Rebel") then
        preferred_owner = Find_Player("Warlords")
    end

    return preferred_owner
end

---@param planet Planet
function LoyaltyPolicyRepository.fondor(planet)
    local preferred_owner = Find_Player("Rebel")
    if planet:get_owner() == Find_Player("Rebel") then
        preferred_owner = Find_Player("Warlords")
    end

    return preferred_owner
end

---@param planet Planet
function LoyaltyPolicyRepository.generis(planet)
    local preferred_owner = Find_Player("Rebel")
    if planet:get_owner() == Find_Player("Rebel") then
        preferred_owner = Find_Player("Warlords")
    end

    return preferred_owner
end

---@param planet Planet
function LoyaltyPolicyRepository.geonosis(planet)
    local preferred_owner = Find_Player("Rebel")
    if planet:get_owner() == Find_Player("Rebel") then
        preferred_owner = Find_Player("Warlords")
    end

    return preferred_owner
end

---@param planet Planet
function LoyaltyPolicyRepository.ghorman(planet)
    local preferred_owner = Find_Player("Rebel")
    if planet:get_owner() == Find_Player("Rebel") then
        preferred_owner = Find_Player("Warlords")
    end

    return preferred_owner
end

---@param planet Planet
function LoyaltyPolicyRepository.glova(planet)
    local preferred_owner = Find_Player("Empire")
    if planet:get_owner() == Find_Player("Empire") then
        preferred_owner = Find_Player("Warlords")
    end

    return preferred_owner
end

---@param planet Planet
function LoyaltyPolicyRepository.gravlex_med(planet)
    local preferred_owner = Find_Player("Rebel")
    if planet:get_owner() == Find_Player("Rebel") then
        preferred_owner = Find_Player("Warlords")
    end

    return preferred_owner
end

---@param planet Planet
function LoyaltyPolicyRepository.gyndine(planet)
    local preferred_owner = Find_Player("Empire")
    if planet:get_owner() == Find_Player("Empire") then
        preferred_owner = Find_Player("Warlords")
    end

    return preferred_owner
end

---@param planet Planet
function LoyaltyPolicyRepository.hapes(planet)
    local preferred_owner = Find_Player("Hapes_Consortium")
    if planet:get_owner() == Find_Player("Hapes_Consortium") then
        preferred_owner = Find_Player("Warlords")
    end

    return preferred_owner
end

---@param planet Planet
function LoyaltyPolicyRepository.honoghr(planet)
    local preferred_owner = Find_Player("Warlords")
    if planet:get_owner() == Find_Player("Rebel") then
        preferred_owner = Find_Player("Empire")
	elseif planet:get_owner() == Find_Player("Empire") then
        preferred_owner = Find_Player("Rebel")
    end

    return preferred_owner
end

---@param planet Planet
function LoyaltyPolicyRepository.iphigin(planet)
    local preferred_owner = Find_Player("Rebel")
    if planet:get_owner() == Find_Player("Rebel") then
        preferred_owner = Find_Player("Warlords")
    end

    return preferred_owner
end

---@param planet Planet
function LoyaltyPolicyRepository.ithor(planet)
    local preferred_owner = Find_Player("Rebel")
    if planet:get_owner() == Find_Player("Rebel") then
        preferred_owner = Find_Player("Warlords")
    end

    return preferred_owner
end

---@param planet Planet
function LoyaltyPolicyRepository.jaemus(planet)
    local preferred_owner = Find_Player("Empire")
    if planet:get_owner() == Find_Player("Empire") then
        preferred_owner = Find_Player("Warlords")
    end

    return preferred_owner
end

---@param planet Planet
function LoyaltyPolicyRepository.jaminere(planet)
    local preferred_owner = Find_Player("Empire")
    if planet:get_owner() == Find_Player("Empire") then
        preferred_owner = Find_Player("Warlords")
    end

    return preferred_owner
end

---@param planet Planet
function LoyaltyPolicyRepository.kaal(planet)
    local preferred_owner = Find_Player("Empire")
    if planet:get_owner() == Find_Player("Empire") then
        preferred_owner = Find_Player("Warlords")
    end

    return preferred_owner
end

---@param planet Planet
function LoyaltyPolicyRepository.kaikielius(planet)
    local preferred_owner = Find_Player("Empire")
    if planet:get_owner() == Find_Player("Empire") then
        preferred_owner = Find_Player("Warlords")
    end

    return preferred_owner
end

---@param planet Planet
function LoyaltyPolicyRepository.kalla(planet)
    local preferred_owner = Find_Player("Warlords")
    if planet:get_owner() == Find_Player("Empire") then
        preferred_owner = Find_Player("Corporate_Sector")
	elseif planet:get_owner() == Find_Player("Corporate_Sector") then
        preferred_owner = Find_Player("Empire")
    end

    return preferred_owner
end

---@param planet Planet
function LoyaltyPolicyRepository.kashyyyk(planet)
    local preferred_owner = Find_Player("Rebel")
    if planet:get_owner() == Find_Player("Rebel") then
        preferred_owner = Find_Player("Warlords")
    end

    return preferred_owner
end

---@param planet Planet
function LoyaltyPolicyRepository.ketaris(planet)
    local preferred_owner = Find_Player("Warlords")
    if planet:get_owner() == Find_Player("Rebel") then
        preferred_owner = Find_Player("Empire")
	elseif planet:get_owner() == Find_Player("Empire") then
        preferred_owner = Find_Player("Rebel")
    end

    return preferred_owner
end

---@param planet Planet
function LoyaltyPolicyRepository.korriban(planet)
    local preferred_owner = Find_Player("Empire")
    if planet:get_owner() == Find_Player("Empire") then
        preferred_owner = Find_Player("Warlords")
    end

    return preferred_owner
end

---@param planet Planet
function LoyaltyPolicyRepository.krant(planet)
    local preferred_owner = Find_Player("Rebel")
    if planet:get_owner() == Find_Player("Rebel") then
        preferred_owner = Find_Player("Warlords")
    end

    return preferred_owner
end

---@param planet Planet
function LoyaltyPolicyRepository.kuat(planet)
    local preferred_owner = Find_Player("Empire")
    if planet:get_owner() == Find_Player("Empire") then
        preferred_owner = Find_Player("Warlords")
    end

    return preferred_owner
end

---@param planet Planet
function LoyaltyPolicyRepository.lianna(planet)
    local preferred_owner = Find_Player("Empire")
    if planet:get_owner() == Find_Player("Empire") then
        preferred_owner = Find_Player("Warlords")
    end

    return preferred_owner
end

---@param planet Planet
function LoyaltyPolicyRepository.liinade(planet)
    local preferred_owner = Find_Player("Empire")
    if planet:get_owner() == Find_Player("Empire") then
        preferred_owner = Find_Player("Warlords")
    end

    return preferred_owner
end

---@param planet Planet
function LoyaltyPolicyRepository.loronar(planet)
    local preferred_owner = Find_Player("Empire")
    if planet:get_owner() == Find_Player("Empire") then
        preferred_owner = Find_Player("Warlords")
    end

    return preferred_owner
end

---@param planet Planet
function LoyaltyPolicyRepository.malastare(planet)
    local preferred_owner = Find_Player("Rebel")
    if planet:get_owner() == Find_Player("Rebel") then
        preferred_owner = Find_Player("Warlords")
    end

    return preferred_owner
end

---@param planet Planet
function LoyaltyPolicyRepository.metellos(planet)
    local preferred_owner = Find_Player("Corporate_Sector")
    if planet:get_owner() == Find_Player("Corporate_Sector") then
        preferred_owner = Find_Player("Warlords")
    end

    return preferred_owner
end

---@param planet Planet
function LoyaltyPolicyRepository.mimban(planet)
    local  preferred_owner = Find_Player("Rebel")
    if planet:get_owner() == Find_Player("Rebel") then
        preferred_owner = Find_Player("Corporate_Sector")
    end

    return preferred_owner
end

---@param planet Planet
function LoyaltyPolicyRepository.mon_calamari(planet)
    local  preferred_owner = Find_Player("Rebel")
    if planet:get_owner() == Find_Player("Rebel") then
        preferred_owner = Find_Player("Warlords")
    end

    return preferred_owner
end

---@param planet Planet
function LoyaltyPolicyRepository.muunilinst(planet)
    local preferred_owner = Find_Player("Pentastar")
    if planet:get_owner() == Find_Player("Pentastar") then
        preferred_owner = Find_Player("Warlords")
    end

    return preferred_owner
end

---@param planet Planet
function LoyaltyPolicyRepository.naboo(planet)
    local preferred_owner = Find_Player("Rebel")
    if planet:get_owner() == Find_Player("Rebel") then
        preferred_owner = Find_Player("Empire")
    end

    return preferred_owner
end

---@param planet Planet
function LoyaltyPolicyRepository.nam_chorios(planet)
    local preferred_owner = Find_Player("Empire")
    if planet:get_owner() == Find_Player("Empire") then
        preferred_owner = Find_Player("Warlords")
    end

    return preferred_owner
end

---@param planet Planet
function LoyaltyPolicyRepository.new_alderaan(planet)
    local preferred_owner = Find_Player("Rebel")
    if planet:get_owner() == Find_Player("Rebel") then
        preferred_owner = Find_Player("Warlords")
    end

    return preferred_owner
end

---@param planet Planet
function LoyaltyPolicyRepository.new_cov(planet)
    local preferred_owner = Find_Player("Rebel")
    if planet:get_owner() == Find_Player("Rebel") then
        preferred_owner = Find_Player("Warlords")
    end

    return preferred_owner
end

---@param planet Planet
function LoyaltyPolicyRepository.nubia(planet)
    local preferred_owner = Find_Player("Empire")
    if planet:get_owner() == Find_Player("Empire") then
        preferred_owner = Find_Player("Warlords")
    end

    return preferred_owner
end

---@param planet Planet
function LoyaltyPolicyRepository.oslumplex(planet)
    local  preferred_owner = Find_Player("Corporate_Sector")
    if planet:get_owner() == Find_Player("Corporate_Sector") then
        preferred_owner = Find_Player("Warlords")
    end

    return preferred_owner
end

---@param planet Planet
function LoyaltyPolicyRepository.paarin_minor(planet)
    local   preferred_owner = Find_Player("Empire")
    if planet:get_owner() == Find_Player("Empire") then
        preferred_owner = Find_Player("Warlords")
    end

    return preferred_owner
end

---@param planet Planet
function LoyaltyPolicyRepository.praesitlyn(planet)
    local  preferred_owner = Find_Player("Rebel")
    if planet:get_owner() == Find_Player("Rebel") then
        preferred_owner = Find_Player("Warlords")
    end

    return preferred_owner
end

---@param planet Planet
function LoyaltyPolicyRepository.prakith(planet)
    local  preferred_owner = Find_Player("Empire")
    if planet:get_owner() == Find_Player("Empire") then
        preferred_owner = Find_Player("Warlords")
    end

    return preferred_owner
end

---@param planet Planet
function LoyaltyPolicyRepository.qretu(planet)
    local  preferred_owner = Find_Player("Empire")
    if planet:get_owner() == Find_Player("Empire") then
        preferred_owner = Find_Player("Warlords")
    end

    return preferred_owner
end

---@param planet Planet
function LoyaltyPolicyRepository.rendili(planet)
local preferred_owner = Find_Player("Rebel")
    if planet:get_owner() == Find_Player("Rebel") then
        preferred_owner = Find_Player("Warlords")
    end

    return preferred_owner
end

---@param planet Planet
function LoyaltyPolicyRepository.roche(planet)
    local preferred_owner = Find_Player("Rebel")
    if planet:get_owner() == Find_Player("Rebel") then
        preferred_owner = Find_Player("Warlords")
    end

    return preferred_owner
end

---@param planet Planet
function LoyaltyPolicyRepository.rodia(planet)
    local preferred_owner = Find_Player("Empire")
    if planet:get_owner() == Find_Player("Empire") then
        preferred_owner = Find_Player("Warlords")
    end

    return preferred_owner
end

---@param planet Planet
function LoyaltyPolicyRepository.rothana(planet)
    local preferred_owner = Find_Player("Empire")
    if planet:get_owner() == Find_Player("Empire") then
        preferred_owner = Find_Player("Warlords")
    end

    return preferred_owner
end

---@param planet Planet
function LoyaltyPolicyRepository.saffalore(planet)
    local preferred_owner = Find_Player("Corporate_Sector")
    if planet:get_owner() == Find_Player("Corporate_Sector") then
        preferred_owner = Find_Player("Empire")
    end

    return preferred_owner
end

---@param planet Planet
function LoyaltyPolicyRepository.saijo(planet)
    local preferred_owner = Find_Player("Rebel")
    if planet:get_owner() == Find_Player("Rebel") then
        preferred_owner = Find_Player("Warlords")
    end

    return preferred_owner
end

---@param planet Planet
function LoyaltyPolicyRepository.sarapin(planet)
    local preferred_owner = Find_Player("Empire")
    if planet:get_owner() == Find_Player("Empire") then
        preferred_owner = Find_Player("Warlords")
    end

    return preferred_owner
end

---@param planet Planet
function LoyaltyPolicyRepository.sluis_van(planet)
    local preferred_owner = Find_Player("Rebel")
    if planet:get_owner() == Find_Player("Rebel") then
        preferred_owner = Find_Player("Warlords")
    end

    return preferred_owner
end

---@param planet Planet
function LoyaltyPolicyRepository.sullust(planet)
    local  preferred_owner = Find_Player("Rebel")
    if planet:get_owner() == Find_Player("Rebel") then
        preferred_owner = Find_Player("Warlords")
    end

    return preferred_owner
end

---@param planet Planet
function LoyaltyPolicyRepository.svivren(planet)
    local preferred_owner = Find_Player("Rebel")
    if planet:get_owner() == Find_Player("Rebel") then
        preferred_owner = Find_Player("Warlords")
    end

    return preferred_owner
end

---@param planet Planet
function LoyaltyPolicyRepository.terephon(planet)
    local preferred_owner = Find_Player("Hapes_Consortium")
    if planet:get_owner() == Find_Player("Hapes_Consortium") then
        preferred_owner = Find_Player("Warlords")
    end

    return preferred_owner
end

---@param planet Planet
function LoyaltyPolicyRepository.thomork(planet)
    local preferred_owner = Find_Player("Empire")
    if planet:get_owner() == Find_Player("Empire") then
        preferred_owner = Find_Player("Warlords")
    end

    return preferred_owner
end

---@param planet Planet
function LoyaltyPolicyRepository.thule(planet)
    local  preferred_owner = Find_Player("Empire")
    if planet:get_owner() == Find_Player("Empire") then
        preferred_owner = Find_Player("Warlords")
    end

    return preferred_owner
end

---@param planet Planet
function LoyaltyPolicyRepository.transitory_mists_I(planet)
    local  preferred_owner = Find_Player("Hapes_Consortium")
    if planet:get_owner() == Find_Player("Hapes_Consortium") then
        preferred_owner = Find_Player("Warlords")
    end

    return preferred_owner
end

---@param planet Planet
function LoyaltyPolicyRepository.transitory_mists_II(planet)
    local preferred_owner = Find_Player("Hapes_Consortium")
    if planet:get_owner() == Find_Player("Hapes_Consortium") then
        preferred_owner = Find_Player("Warlords")
    end

    return preferred_owner
end

---@param planet Planet
function LoyaltyPolicyRepository.transitory_mists_III(planet)
    local preferred_owner = Find_Player("Hapes_Consortium")
    if planet:get_owner() == Find_Player("Hapes_Consortium") then
        preferred_owner = Find_Player("Warlords")
    end

    return preferred_owner
end

---@param planet Planet
function LoyaltyPolicyRepository.ord_trasi(planet)
    local preferred_owner = Find_Player("Empire")
    if planet:get_owner() == Find_Player("Empire") then
        preferred_owner = Find_Player("Warlords")
    end

    return preferred_owner
end

---@param planet Planet
function LoyaltyPolicyRepository.tynna(planet)
    local preferred_owner = Find_Player("Rebel")
    if planet:get_owner() == Find_Player("Rebel") then
        preferred_owner = Find_Player("Warlords")
    end

    return preferred_owner
end

---@param planet Planet
function LoyaltyPolicyRepository.vergesso(planet)
    local preferred_owner = Find_Player("Rebel")
    if planet:get_owner() == Find_Player("Rebel") then
        preferred_owner = Find_Player("Warlords")
    end

    return preferred_owner
end

---@param planet Planet
function LoyaltyPolicyRepository.vondarc(planet)
    local preferred_owner = Find_Player("Eriadu_Authority")
    if planet:get_owner() == Find_Player("Eriadu_Authority") then
        preferred_owner = Find_Player("Warlords")
    end

    return preferred_owner
end

---@param planet Planet
function LoyaltyPolicyRepository.vulpter(planet)
    local preferred_owner = Find_Player("Rebel")
    if planet:get_owner() == Find_Player("Rebel") then
        preferred_owner = Find_Player("Warlords")
    end

    return preferred_owner
end

---@param planet Planet
function LoyaltyPolicyRepository.woostri(planet)
    local preferred_owner = Find_Player("Rebel")
    if planet:get_owner() == Find_Player("Rebel") then
        preferred_owner = Find_Player("Empire")
    end

    return preferred_owner
end

---@param planet Planet
function LoyaltyPolicyRepository.wroona(planet)
    local preferred_owner = Find_Player("Rebel")
    if planet:get_owner() == Find_Player("Rebel") then
        preferred_owner = Find_Player("Empire")
    end

    return preferred_owner
end

---@param planet Planet
function LoyaltyPolicyRepository.yaga_minor(planet)
    local preferred_owner = Find_Player("Empire")
    if planet:get_owner() == Find_Player("Empire") then
        preferred_owner = Find_Player("Warlords")
    end

    return preferred_owner
end

---@param planet Planet
function LoyaltyPolicyRepository.yagdhul(planet)
    local preferred_owner = Find_Player("Rebel")
    if planet:get_owner() == Find_Player("Rebel") then
        preferred_owner = Find_Player("Warlords")
    end

    return preferred_owner
end

---@param planet Planet
function LoyaltyPolicyRepository.yavin(planet)
    local  preferred_owner = Find_Player("Rebel")
    if planet:get_owner() == Find_Player("Rebel") then
        preferred_owner = Find_Player("Warlords")
    end

    return preferred_owner
end


