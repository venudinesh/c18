/*
 * Copyright 2020, The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#define LOG_TAG "Gnss-main"

#include <android-base/logging.h>
#include <android/binder_manager.h>
#include <android/binder_process.h>
#include <android/hardware/gnss/2.1/IGnss.h>
#include <hidl/HidlSupport.h>
#include <hidl/HidlTransportSupport.h>
#include <hidl/LegacySupport.h>
#include <log/log.h>
#include <pthread.h>
#include "AidlGnss.h"

using aidl::android::hardware::gnss::AidlGnss;
using ::android::hardware::gnss::V2_1::IGnss;
using ::android::OK;
using ::android::sp;
using ::android::status_t;
using ::android::hardware::configureRpcThreadpool;
using ::android::hardware::joinRpcThreadpool;
using ::android::hardware::registerPassthroughServiceImplementation;

int main() {
    ABinderProcess_setThreadPoolMaxThreadCount(1);
    ABinderProcess_startThreadPool();
    configureRpcThreadpool(1, false /* callerWillJoin */);

    std::shared_ptr<AidlGnss> gnssAidl = ndk::SharedRefBase::make<AidlGnss>();
    const std::string instance = std::string() + AidlGnss::descriptor + "/default";
    binder_status_t status =
            AServiceManager_addService(gnssAidl->asBinder().get(), instance.c_str());
    CHECK_EQ(status, STATUS_OK);
    status_t hidl_status = registerPassthroughServiceImplementation<IGnss>("default");
    CHECK_EQ(hidl_status, OK);

    ABinderProcess_joinThreadPool();

    return EXIT_FAILURE;  // should not reach
}
