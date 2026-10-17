# Open questions (session 2)

Follow-ups raised by your answers and by the research. Same format: reply with "Author:" lines, or "go with the recommendation".

**1. Pro vs Classic: final call.** Findings and recommendation are in [research/pro-vs-classic.md](research/pro-vs-classic.md). In short: Pro numbers are canonical, plus the union of fire modes (restoring e.g. the M50's semi-auto and the XMV-850's 2400/3600 RPM), plus an `arcade` (Pro) vs `grounded` (Classic) handling preset per weapon, plus dramatic Classic-only capacity cases as named variants. Accept?

Author: I answered in the "research/pro-vs-classic.md" doc itself. Turns out I want Classic instead of Pro, but with some Pro characteristics and a caveats included. It would only be one unified preset - the one that is Classic leaning but with selected pro enhancements. See that doc for more details.

**2. Physical unit model for recoil and knockback.** Proposal: model forces as **impulse** (newton-seconds), the way real recoil works (bullet mass × velocity + propellant gas), and derive game feel from it.
- Weapon: `recoil_impulse` (N·s per shot), `mass` (kg).
- Wielder or mount: `mass` (kg), `grip` (how much impulse the hands/arms absorb before the aim kicks), `bracing` (crouch, bipod, mounted, power armour multiply it).
- Felt kick ≈ `recoil_impulse / (weapon_mass + effective wielder stability)`, so a heavy rifle kicks less than a light one with the same cartridge, power armour shrugs off what bowls over a human, and a tank cannon on a pickup flips the pickup but rocks the tank.
- Knockback on targets uses the same unit: `impact_impulse` (N·s) against target mass gives the velocity change, so it works in any gravity, including zero-g, where firing a heavy gun pushes *you* backwards.
- Reference scale (real-world ballpark): pistol ~2–4 N·s, assault rifle ~4–6, shotgun ~10–15, battle/anti-materiel rifle ~20–60, recoilless/launcher/vehicle cannon 100s to 1000s.
- BW's numbers (view-kick angles, chaos) stay as the **calibration target**: I'd fit `grip`/`stability` defaults so a normal human wielding each converted weapon reproduces BW's feel, and then the physics takes over for anything non-human.

Does this match what you had in mind? (You don't need to know the physics, only whether "recoil = push in N·s, resisted by mass and grip" feels like the right knob.)

Author: Bingo, yes this is it. Proposal accepted.

**3. GitHub visibility: one private dev repo + one public release.** The working folder contains material that shouldn't be in a public open-source repo: decompiled BW code and descriptions (the BW team's work), BW icons, and Epic's UT2004 runtime. But your cloud sessions *need* the decompiled sources to do the work.
*Recommendation:* make this working repo **private** on GitHub (Claude Code cloud can work with private repos). The UT2004 runtime and `trash/` stay out of git entirely (Windows binaries, not needed in the cloud). Publish the shippable `kit/` to a separate **public** repo (and itch.io) when releases are ready. OK?

Author: Hmm, private repos on github are paid so I can't use them (I'm poor), but I can get this project built and done in a public repo that none will look at (forever alone.jpg, no one visits my github), then delete/reset the repo with a new one once we've completed the project, with the working materials kept on my local computer and me being able to keep the decompiled sources if we need them in the future or simply delete them.

**4. Credit line.** The kit severs BW names and lore, but open-source etiquette (and goodwill) suggests a single "inspired by Ballistic Weapons for UT2004 by the BW team" line in the public README and credits. Include it, or keep the public kit fully silent about its origin?

Author: A single line is ok. "Inspired by Ballistic Weapons mod for UT2004 by the Runestorm team + Relics and Rayguns server team."

**5. Stock UT2004 vehicle weapons too?** The decompile now includes UT2004's own Onslaught vehicles (tank cannon, flak, mantis/raptor guns, Leviathan, etc.) in addition to BW's vehicle pack. They're natural candidates for the detachable heavy-weapon class. Include them as extra source material?
*Recommendation:* yes, as source material for the vehicle-weapon phase only.

Author: Sure, I'm ok with it. Worth mentioning that stock UT2004 weapons and vehicles do not have any of the advanced mechanics that we're specifically built for BW, so you'd have to "invent" their stats to match the BW standard. By that measure even the default UT2004 handheld weapon arsenal can also be included in such a way too.

**6. Pilot size.** I plan to do all 12 pilot weapons you listed, but deliver them in two steps: first X3 Knife, M806A2, Fifty-9 (your staples) together with the core-mechanics drafts and schema, so you can correct the format early. Then the other 9. OK?

Author: Ok, sounds good.
