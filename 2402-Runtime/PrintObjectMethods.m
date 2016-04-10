//
//  PrintObjectMethods.m
//  Objective-C_iOS7PushingTheLimits
//
//  Created by Yuen on 16/4/11.
//  Copyright © 2016年 Yuen-iMac. All rights reserved.
//

#import "PrintObjectMethods.h"
#import <Foundation/Foundation.h>

void PrintObjectMethods() {
    unsigned int count;
    Method *method = class_copyMethodList([NSObject class], &count);
    for (unsigned int i = 0; i < count; i++) {
        /**
         *  output
         classForPortCoder
         replacementObjectForPortCoder:
         _conformsToProtocolNamed:
         methodDescriptionForSelector:
         _localClassNameForClass
         _isToManyChangeInformation
         _receiveBox:
         removeObservation:
         receiveObservedValue:
         receiveObservedError:
         finishObserving
         _observerStorage
         addChainedObservers:
         addObserverBlock:
         addObservationTransformer:
         addObserver:
         performSelector:onThread:withObject:waitUntilDone:modes:
         performSelectorOnMainThread:withObject:waitUntilDone:modes:
         performSelectorOnMainThread:withObject:waitUntilDone:
         performSelector:onThread:withObject:waitUntilDone:
         performSelectorInBackground:withObject:
         performSelector:withObject:afterDelay:inModes:
         performSelector:withObject:afterDelay:
         performSelector:object:afterDelay:
         addObserver:forObservableKeyPath:
         setObservation:forObservingKeyPath:
         removeObservation:forObservableKeyPath:
         autoContentAccessingProxy
         classForCoder
         replacementObjectForCoder:
         awakeAfterUsingCoder:
         _allowsDirectEncoding
         implementsSelector:
         classForKeyedArchiver
         replacementObjectForKeyedArchiver:
         _changeValueForKey:key:key:usingBlock:
         _implicitObservationInfo
         _notifyObserversForKeyPath:change:
         _changeValueForKey:usingBlock:
         _pendingChangeNotificationsArrayForKey:create:
         _willChangeValuesForKeys:
         _didChangeValuesForKeys:
         observationInfo
         setObservationInfo:
         willChange:valuesAtIndexes:forKey:
         didChange:valuesAtIndexes:forKey:
         willChangeValueForKey:withSetMutation:usingObjects:
         didChangeValueForKey:withSetMutation:usingObjects:
         willChangeValueForKey:
         didChangeValueForKey:
         _addObserver:forProperty:options:context:
         _removeObserver:forProperty:
         removeObserver:forKeyPath:context:
         addObserver:forKeyPath:options:context:
         removeObserver:forKeyPath:
         observeValueForKeyPath:ofObject:change:context:
         _isKVOA
         valueForUndefinedKey:
         setValue:forUndefinedKey:
         setNilValueForKey:
         setValue:forKeyPath:
         validateValue:forKeyPath:error:
         validateValue:forKey:error:
         mutableArrayValueForKeyPath:
         mutableArrayValueForKey:
         mutableOrderedSetValueForKeyPath:
         mutableOrderedSetValueForKey:
         mutableSetValueForKeyPath:
         mutableSetValueForKey:
         dictionaryWithValuesForKeys:
         setValuesForKeysWithDictionary:
         valueForKeyPath:
         valueForKey:
         setValue:forKey:
         replacementObjectForArchiver:
         classForArchiver
         _cfTypeID
         isNSValue__
         isNSNumber__
         isNSArray__
         isNSDictionary__
         isNSData__
         isNSOrderedSet__
         isNSSet__
         isNSDate__
         isNSTimeZone__
         isNSString__
         doesNotRecognizeSelector:
         methodSignatureForSelector:
         __dealloc_zombie
         __retain_OA
         __release_OA
         __autorelease_OA
         ___tryRetain_OA
         _copyDescription
         description
         zone
         retain
         release
         autorelease
         retainCount
         dealloc
         copy
         finalize
         forwardInvocation:
         _tryRetain
         _isDeallocating
         retainWeakReference
         allowsWeakReference
         isFault
         performSelector:
         doesNotRecognizeSelector:
         methodSignatureForSelector:
         forwardingTargetForSelector:
         methodForSelector:
         isEqual:
         self
         performSelector:withObject:
         performSelector:withObject:withObject:
         isProxy
         isKindOfClass:
         isMemberOfClass:
         conformsToProtocol:
         respondsToSelector:
         hash
         superclass
         description
         mutableCopy
         class
         debugDescription
         init
         */
        SEL sel = method_getName(method[i]);
        const char *name = sel_getName(sel);
        printf("%s\n", name);
    }
}