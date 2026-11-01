public with sharing class setcls {
    
    public static void m1(){
        
        //Set<PDT/Collection> st = new Set<PDT/collection>();
        
        Set<Integer> st = new Set<Integer>();
        //1 way
        st.add(1212);
        st.add(1218);
        st.add(1205);
        st.add(1202);
        st.add(1241);
        //2 way
        Set<Integer> st1 = new Set<Integer>{1,2,3,4,5,6,7,8,9,0};
        
        System.debug('>>>>>>>>>>>Set Elements>>>>>>>>>>>>>>>'+st);
        System.debug('>>>>>>>>>>>Set Elements>>>>>>>5>>>>>>>>'+st.size());
        
        System.debug('>>>>>>False>>>>>>>>>'+st.contains(1244));
        System.debug('>>>>>>true>>>>>>>>>'+st.contains(1241));
        
        st.remove(1241);
        System.debug('>>>>>>>>>>>Set Elements size>>>>>>>>>4>>>>>>'+st.size());
        
        st.add(1202);//
        st.add(1241);//1
        st.add(1242);//1
        st.add(1257);//1
        st.add(1212);//
        
        System.debug('>>>>>>>>>>>Set Elements size>>>>>>7>>>>>>>>>'+st.size());
                
        Set<Integer> newst1 = st.clone();
        Set<Integer> newst2 = new Set<Integer>{1224,1235};
        newst2.addAll(st);
        
        System.debug('>>>>>>>>>>>Set1 Elements size>>>>>>7>>>>>>>>>'+newst1.size());
        System.debug('>>>>>>>>>>>Set1 Elements size>>>>>>9>>>>>>>>>'+newst2.size());
        
        st.clear();
        st = new Set<Integer>();
        
        System.debug('>>>>>>true>>>>>>>>'+st.isEmpty());
        System.debug('>>>>>>false>>>>>>>>'+st1.isEmpty());
        
        
        List<Integer> lst = new List<Integer>{1,2,3,4,5,6,7,8,8,9,0,1,3,5,8,9,4,5,6,7,8};
        System.debug('>>>>>>20>>>>>>>>>>>'+lst.size());
        
        Set<Integer> st4 = new Set<Integer>();
        st4.addAll(lst);
        System.debug('>>>>>>10>>>>>>>>>>>'+st4.size());
        lst.clear();
        lst.addAll(st4);
        
    
    
    
    
}
}