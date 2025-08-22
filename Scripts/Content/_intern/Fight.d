// *******************************
// Combat AI class and constants
// *******************************

// Reactions of NPCs can be:
const int MOVE_RUN = 1; // Enemy in my focus + is someone standing in between? (G)
const int MOVE_RUNBACK = 2; // Enemy in my focus
const int MOVE_JUMPBACK = 3;
const int MOVE_TURN = 4; // Always until enemy is in focus (so never interrupted by a new action, only by enemy attack)
const int MOVE_STRAFE = 5; // (direction is decided by the program)
const int MOVE_ATTACK = 6; // in ComboZone = combo / while running = charge attack?
const int MOVE_SIDEATTACK = 7;
const int MOVE_FRONTATTACK = 8;
const int MOVE_TRIPLEATTACK = 9;
const int MOVE_WHIRLATTACK = 10;
const int MOVE_MASTERATTACK = 11;
const int MOVE_TURNTOHIT = 15; // Version > 0.92 => no effect
const int MOVE_PARADE = 17; // (no attack = up)
const int MOVE_STANDUP = 18;
const int MOVE_WAIT = 19;
const int MOVE_WAIT_LONGER = 23; // Attention: Must be 23, since the program still has some unused moves between 19 and 22
const int MOVE_WAIT_EXT = 24; // Attention: Must be 24, since the program still has some unused moves between 19 and 22

const int MAX_MOVE = 6; // FightMove variations per FAI function

const int MAX_FIGHTAI = 50; // Number of existing fight AIs // Constant NOT redundant in the program code, can be changed arbitrarily here

// ****** 
// Class
// ******

class C_FightAI
{
    var int move[MAX_MOVE];
};
