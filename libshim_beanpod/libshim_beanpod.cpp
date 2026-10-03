#include <keymaster/android_keymaster_messages.h>

extern "C" {
void _ZN9keymaster19GenerateKeyResponseD1Ev() {}
void _ZN9keymaster17AttestKeyResponseD1Ev() {}
void _ZN9keymaster16ImportKeyRequest14SetKeyMaterialEPKvm(keymaster::ImportKeyRequest* thisptr, const uint8_t* key_material, size_t length) {
    // Mengisikan pointer buffer key_material langsung ke key_data bertipe uint8_t*
    thisptr->key_data = const_cast<uint8_t*>(key_material);
}
}
