//
//  pinMapsDropTest.m
//  PinMaps
//
//  Created by Presley on 20/12/14.
//  Copyright (c) 2014 SlaaySourceCoders. All rights reserved.
//
//Source : http://www.techotopia.com/index.php/Working_with_Maps_on_iOS_7_with_MapKit_and_the_MKMapView_Class
//http://www.devfright.com/mkpointannotation-tutorial/
#import "pinMapsDropTest.h"
#import "constants.h"
#import "SWRevealViewController.h"


@interface pinMapsDropTest ()

@end

@implementation pinMapsDropTest

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [super viewDidLoad];
    _mapView.showsUserLocation = YES;
    _mapView.delegate = self;
    _isZoomEnabled = true;
        [self setSlideaction];
}

-(void)setSlideaction {
    // Change button color
    _sidebarButton.tintColor = [UIColor colorWithWhite:0.1f alpha:0.9f];
    
    // Set the side bar button action. When it's tapped, it'll show up the sidebar.
    _sidebarButton.target = self.revealViewController;
    _sidebarButton.action = @selector(revealToggle:);
    
    // Set the gesture
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)btnDropPin:(id)sender {
    NSLog(@"Drop a pin!!!");
    
   MKPointAnnotation *randomAnnotation = [[MKPointAnnotation alloc]init];
   CLLocationCoordinate2D pinCoordinate;
   pinCoordinate.latitude = 51.49795;
   pinCoordinate.longitude = -0.174056;
   randomAnnotation.coordinate = pinCoordinate;
   randomAnnotation.coordinate = CLLocationCoordinate2DMake(15.4989, 73.8278);
   randomAnnotation.title = @"A random pin";
   randomAnnotation.subtitle = @"+Point";
    [_mapView addAnnotation:randomAnnotation];
}

- (IBAction)btnZoom:(id)sender {
  //Disable zoom http://stackoverflow.com/a/15419639/1051198
    
    if (self.isZoomEnabled == true) {
        self.mapView.zoomEnabled = NO;
        self.isZoomEnabled = false;
    } else {
        self.mapView.zoomEnabled = YES;
        self.isZoomEnabled =true;
    }
}

- (IBAction)btnChangeMap:(id)sender {
    if (_mapView.mapType == MKMapTypeStandard)
        _mapView.mapType = MKMapTypeSatellite;
    else
        _mapView.mapType = MKMapTypeStandard;
}

- (IBAction)btnDropRandomPin:(id)sender {
    //http://stackoverflow.com/questions/18520949/fetching-parsing-data-from-a-json-file-in-ios
    NSString *filePath = [[NSBundle mainBundle] pathForResource:countryJSONFile ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    /* Log out all whole JSON
     NSLog(@"The latitude is %@", jsonDictionary);
    */
    

    
    
    for (NSString *outerKey in jsonDictionary.allKeys) {
        
        NSDictionary *slot = [jsonDictionary valueForKey:outerKey];
        
        for (NSString *innerKey in slot.allKeys) {
            NSDictionary *innerDictionary = [slot valueForKey:innerKey];
        
            // code
            NSString * _longitudeO = [innerDictionary valueForKey:keyLongitude];
            NSString * _latitudeO = [innerDictionary valueForKey:keyLatitude];
            NSString * _countryO = [innerDictionary valueForKey:keyName];
            
            NSLog(@"longitude : %@, latitude : %@, name %@ :",_longitudeO, _latitudeO, _countryO);
            
            NSString *trimmedLongitudeO = [_longitudeO stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
            NSString *trimmedLatitudeO = [_latitudeO stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
            
            if ((trimmedLatitudeO.length == 0) || (trimmedLongitudeO.length == 0)) {
                continue;
            } else {
            
                MKPointAnnotation *randomAnnotation = [[MKPointAnnotation alloc]init];
                CLLocationCoordinate2D pinCoordinate;
               
                pinCoordinate.latitude = _latitudeO.floatValue;
                pinCoordinate.longitude = _longitudeO.floatValue;
                randomAnnotation.coordinate = pinCoordinate;
                randomAnnotation.title = @"You found me!!";
                randomAnnotation.subtitle =  [@"Country : " stringByAppendingString:_countryO];
                [_mapView addAnnotation:randomAnnotation];
            }
        }
      
    }
    
}




- (IBAction)btnDropPinsByCount:(id)sender {

    [self dropPinsByCount:15];
}


- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:
(MKUserLocation *)userLocation
{
//    _mapView.centerCoordinate =
//    userLocation.location.coordinate;

    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 800, 800);
    [_mapView setRegion:[_mapView regionThatFits:region] animated:YES];
    
    // Add an annotation
    MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
    point.coordinate = userLocation.coordinate;
    point.title = @"You found me!";
    point.subtitle = @"+Point";
    
    [_mapView addAnnotation:point];

}


/*Lee : Use this function to drop number of pin based on the argument sent by the user*/
-(id)dropPinsByCount:(int)pincount{
    
    //Read from the JSON file
    NSString *filePath = [[NSBundle mainBundle] pathForResource:countryJSONFile ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
    
    
    //create an array and fill the array with random numbers
    NSMutableArray *arrayOfRandomPinDrops = [NSMutableArray array];
    for (int i = 0; i < pincount; i++) {
        [arrayOfRandomPinDrops addObject: [NSNumber numberWithInt: arc4random() % pincount]];
    }
    
    //Drop the pins : Fire in the hole!
    NSString *randomPinDropIndex;
    
    for (NSString *outerKey in jsonDictionary.allKeys) {
        
        NSDictionary *slot = [jsonDictionary valueForKey:outerKey];
        
        for (int j=0; j <= arrayOfRandomPinDrops.count -1; j++){
            
            randomPinDropIndex =  [NSString stringWithFormat:@"%@", [arrayOfRandomPinDrops objectAtIndex:j]];
            NSLog(@"The random number at Position %d is %@", j, randomPinDropIndex);
            
            NSDictionary *innerDictionary = [slot valueForKey:randomPinDropIndex];
            
            // code
            NSString * _longitudeO = [innerDictionary valueForKey:keyLongitude];
            NSString * _latitudeO = [innerDictionary valueForKey:keyLatitude];
            NSString * _countryO = [innerDictionary valueForKey:keyName];
            
            NSLog(@"longitude : %@, latitude : %@, name %@ :",_longitudeO, _latitudeO, _countryO);
            
            NSString *trimmedLongitudeO = [_longitudeO stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
            NSString *trimmedLatitudeO = [_latitudeO stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
            
            if ((trimmedLatitudeO.length == 0) || (trimmedLongitudeO.length == 0)) {
                //we do not want blank values for co ordinates.
                continue;
            } else {
                
                MKPointAnnotation *randomAnnotation = [[MKPointAnnotation alloc]init];
                CLLocationCoordinate2D pinCoordinate;
                
                pinCoordinate.latitude = _latitudeO.floatValue;
                pinCoordinate.longitude = _longitudeO.floatValue;
                randomAnnotation.coordinate = pinCoordinate;
                randomAnnotation.title = @"You found me!!";
                randomAnnotation.subtitle =  [@"Country : " stringByAppendingString:_countryO];
                [_mapView addAnnotation:randomAnnotation];
            }
            
        }
        
    }
   
    return 0;
};


- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKPinAnnotationView *)view {
    //Change the  color of the pin user tap!!
    //http://stackoverflow.com/a/14623736/1051198
    view.pinColor = MKPinAnnotationColorGreen;
}


@end
