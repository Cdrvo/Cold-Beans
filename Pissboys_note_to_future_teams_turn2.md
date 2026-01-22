Hi! HuyTheKiller from Pissboys here.

Quick summary on our second turn:
* More jokers (featuring self-inserts!).
* 2 new decks:
    * Daily Deck: fixed seed of DDMMYYYY, different deck effect (and sprite) based on day of the week
    * Athena Deck: start run with Amphora and Krater
* Undiscovered sprites for all consumable types that didn't have one
* A lot of bug fixes

NOTE: I've made a bandage fix to Back Alley crash on run reload at /Content/4_Pissboys/items/back_alley/alley.lua:240, but it looks goofy because of the event order. If someone's kind enough I'd like that to be addressed. Also make sure to check for the remaining areas to see if G.SHOP_SIGN is not there, otherwise reloading a run while inside will cause a crash-lock.