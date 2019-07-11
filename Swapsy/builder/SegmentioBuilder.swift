
import UIKit
import Segmentio

struct SegmentioBuilder {
    static func startBuild(segmentioView: Segmentio,
                                    segmentioStyle: SegmentioStyle,
                                    segmentioPosition: SegmentioPosition = .fixed(maxVisibleItems: 4)) {
        segmentioView.setup(
            content: segmentioContent(),
            style: segmentioStyle,
            options: segmentioOptions(style: segmentioStyle, position: segmentioPosition)
        )
    }
    
    private static func segmentioContent() -> [SegmentioItem] {
        let plist = PlistModel()
        var _re: [SegmentioItem] = []
        for currency in plist.currency ?? [] {
            _re.append(SegmentioItem(title: currency, image: UIImage(named: currency)))
        }
        
        return _re
    }
    
    private static func segmentioOptions(style: SegmentioStyle, position: SegmentioPosition) -> SegmentioOptions {
        var imageContentMode = UIView.ContentMode.center
        switch style {
        case .imageBeforeLabel, .imageAfterLabel:
            imageContentMode = .scaleAspectFit
        default:
            break
        }
        
        return SegmentioOptions(
            backgroundColor: SwapsyColor.white,
            segmentPosition: position,
            scrollEnabled: true,
            indicatorOptions: segmentioIndicatorOptions(),
            horizontalSeparatorOptions: segmentioHorizontalSeparatorOptions(),
            verticalSeparatorOptions: segmentioVerticalSeparatorOptions(),
            imageContentMode: imageContentMode,
            labelTextAlignment: .center,
            labelTextNumberOfLines: 1,
            segmentStates: segmentioStates(),
            animationDuration: 0.3
        )
    }
    
    private static func segmentioStates() -> SegmentioStates {
        let font = UIFont.swapsyFontDefault(ofSize: 13)
        return SegmentioStates(
            defaultState: SegmentioState(backgroundColor: SwapsyColor.white, titleFont: font, titleTextColor: SwapsyColor.swapsyBlue),
            selectedState: SegmentioState(backgroundColor: SwapsyColor.white, titleFont: font, titleTextColor: SwapsyColor.swapsyBlue),
            highlightedState: SegmentioState(backgroundColor: SwapsyColor.white, titleFont: font, titleTextColor: SwapsyColor.swapsyBlue)
        )
    }
    
    private static func segmentioIndicatorOptions() -> SegmentioIndicatorOptions {
        return SegmentioIndicatorOptions(
            type: .bottom,
            ratio: 1,
            height: 5,
            color: SwapsyColor.swapsyBlue
        )
    }
    
    private static func segmentioHorizontalSeparatorOptions() -> SegmentioHorizontalSeparatorOptions {
        return SegmentioHorizontalSeparatorOptions(
            type: .topAndBottom,
            height: 1,
            color: SwapsyColor.white
        )
    }
    
    private static func segmentioVerticalSeparatorOptions() -> SegmentioVerticalSeparatorOptions {
        return SegmentioVerticalSeparatorOptions(
            ratio: 1,
            color: SwapsyColor.white
        )
    }
}
