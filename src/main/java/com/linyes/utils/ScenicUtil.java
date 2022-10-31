package com.linyes.utils;

import com.linyes.pojo.ScenicSpot;
import com.linyes.vo.Scenic;

public class ScenicUtil {

    public static ScenicSpot transform(Scenic scenic){
        ScenicSpot scenicSpot=new ScenicSpot();
        scenicSpot.setScenicName(scenic.getScenicname());
        scenicSpot.setScenicImage(scenic.getScenicimage());
        scenicSpot.setScenicDescribe(scenic.getScenicdescribe());
        scenicSpot.setScenicAddress(scenic.getScenicaddress());
        scenicSpot.setLongitude(scenic.getLongitude());
        scenicSpot.setLatitude(scenic.getLatitude());
        scenicSpot.setProv(scenic.getProv());
        return scenicSpot;
    }
    public static ScenicSpot transformAll(Scenic scenic,String id){
        ScenicSpot scenicSpot=new ScenicSpot();
        scenicSpot.setScenicName(scenic.getScenicname());
        scenicSpot.setScenicImage(scenic.getScenicimage());
        scenicSpot.setScenicDescribe(scenic.getScenicdescribe());
        scenicSpot.setScenicAddress(scenic.getScenicaddress());
        scenicSpot.setLongitude(scenic.getLongitude());
        scenicSpot.setLatitude(scenic.getLatitude());
        scenicSpot.setProv(scenic.getProv());
        scenicSpot.setId(id);
        return scenicSpot;
    }
}
