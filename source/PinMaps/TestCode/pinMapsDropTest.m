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
}

- (IBAction)btnChangeMap:(id)sender {
    if (_mapView.mapType == MKMapTypeStandard)
        _mapView.mapType = MKMapTypeSatellite;
    else
        _mapView.mapType = MKMapTypeStandard;
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


@end
