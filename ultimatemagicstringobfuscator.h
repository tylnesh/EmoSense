#ifndef ULTIMATEMAGICPASSWORDOBFUSCATOR_H
#define ULTIMATEMAGICPASSWORDOBFUSCATOR_H
#include <string>



class UltimateMagicStringObfuscator
{
    template <char C>
    const char* makeStringPart() {
        char* made = new char[2];
        made[0] = C;
        made[1] = 0;
        return made;
    }

    template <char C1, char C2, char... Cs>
    const char* makeStringPart() {
        char* made = new char[3 + sizeof...(Cs)];
        const char* old = makeStringPart<C2, Cs...>();
        made[0] = C1;
        for (unsigned int i = 0; i < 2 + sizeof...(Cs); i++)
            made[i + 1] = old[i];
        delete old;
        return made;
    }


public:
    UltimateMagicStringObfuscator();
    std::string makePassword();
    std::string makeIp();
    std::string makeName();
    std::string makeLogin();
    std::string makeSalt();

};

#endif // ULTIMATEMAGICPASSWORDOBFUSCATOR_H
