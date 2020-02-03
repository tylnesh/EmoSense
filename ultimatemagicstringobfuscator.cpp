#include "ultimatemagicstringobfuscator.h"

UltimateMagicStringObfuscator::UltimateMagicStringObfuscator()
{

}



 std::string UltimateMagicStringObfuscator::makePassword() {
    const char* got = makeStringPart<'h', 'e', 's', 'l', 'o', 'N', 'a', 'D', 'a', 't', 'a', 'b', 'a', 'z', 'u'>();
    std::string str = got;
    delete got;
    return str;
}

 std::string UltimateMagicStringObfuscator::makeIp() {
    const char* got = makeStringPart<'1','5','7','.','2','3','0','.','1','2','4','.','5','6'>();
    std::string str = got;
    delete got;
    return str;
}


 std::string UltimateMagicStringObfuscator::makeName() {
    const char* got = makeStringPart<'e','m','o','s','e','n','s','e'>();
    std::string str = got;
    delete got;
    return str;
}


 std::string UltimateMagicStringObfuscator::makeLogin() {
    const char* got = makeStringPart<'e','m','o','s','e','n','s','e'>();
    std::string str = got;
    delete got;
    return str;
}

 std::string UltimateMagicStringObfuscator::makeSalt() {
     const char* got = makeStringPart<'s','g','o','s','s','x','g','h','g','o','s','s','6','u','u','i','9','l','k','k','h','3','q','a','4','4','j','h','s','g','o','s','s','x','g','h'>();
     std::string str = got;
     delete got;
     return str;
 }

