//
//  CNPickerField.h
//  NWFieldPicker
//
//  Created by Scott Andrew on 9/25/09.
//  Copyright 2009 New Wave Digital Media. All rights reserved.
//
//  This source code is provided under BSD license, the conditions of which are listed below. 
//
//  Redistribution and use in source and binary forms, with or without modification, are permitted 
//  provided that the following conditions are met:
//
//  • Redistributions of source code must retain the above copyright notice, this list of 
//   conditions and the following disclaimer.
//  • Redistributions in binary form must reproduce the above copyright notice, this list of conditions
//   and the following disclaimer in the documentation and/or other materials provided with the distribution.
//  • Neither the name of Positive Spin Media nor the names of its contributors may be used to endorse or 
//   promote products derived from this software without specific prior written permission.
//
//  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED 
//  WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A 
//  PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY 
//  DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, 
//  PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER 
//  CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE 
//  OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH 
//  DAMAGE.

#import <Foundation/Foundation.h> 
#import <UIKit/UIKit.h>

extern NSString* UIPickerViewBoundsUserInfoKey;

extern NSString* UIPickerViewWillShownNotification;
extern NSString* UIPickerViewDidShowNotification;
extern NSString* UIPickerViewWillHideNotification;
extern NSString* UIPickerViewDidHideNotification;

@class NWPickerView;
@protocol NWPickerFieldDelegate;


@interface NWPickerField : UITextField<UIPickerViewDataSource, UIPickerViewDelegate> {
	NSString*					_key;
@private
	NWPickerView*				pickerView;
	NSMutableArray*				componentStrings;
    NSMutableArray*				componentKeys;
	NSString*					formatString;
	UIImageView*				indicator;
	NSString*					value;
	id<NWPickerFieldDelegate>	_delegate;

}

@property(nonatomic,assign) IBOutlet id<NWPickerFieldDelegate> delegate;
@property(nonatomic, copy) NSString* formatString;
@property(nonatomic, retain) NSString* value;
@property(nonatomic, retain) id key;

-(void)selectRow:(NSInteger)row inComponent:(NSInteger)component animated:(BOOL)animated;
-(void)selectRowFirst;
-(void)selectRowSecond;
-(void)titleFromkey:(NSString *)keyData;
-(void)reloadData;
-(NSInteger) selectedRowInComponent:(NSInteger)component;


@end

@protocol NWPickerFieldDelegate<NSObject>
@optional
-(NSString*) pickerField:(NWPickerField *)pickerField keyForRow:(NSInteger)row forComponent:(NSInteger)component;
-(void)closedPickerViewInPickerField:(NWPickerField *)pickerField;

@required
-(NSInteger) numberOfComponentsInPickerField:(NWPickerField*)pickerField;
-(NSInteger) pickerField:(NWPickerField*)pickerField numberOfRowsInComponent:(NSInteger)component;
-(NSString*) pickerField:(NWPickerField *)pickerField titleForRow:(NSInteger)row forComponent:(NSInteger)component;
-(void)pickerFieldDidEndEditing:(NWPickerField*)pickerField;

@end
